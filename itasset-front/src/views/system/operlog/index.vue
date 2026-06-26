<!-- Operlog management page -->
<template>
  <div class="operlog-page art-full-height">
    <div class="flex flex-col h-full">
      <!-- Search bar -->
      <OperlogSearch v-show="showSearch" v-model="searchForm" @search="handleSearch" @reset="resetSearchParams" />

      <ElCard
        class="art-table-card flex flex-col flex-1 min-h-0"
        shadow="never"
        :style="{ 'margin-top': showSearch ? '12px' : '0' }"
      >
        <!-- Table header -->
        <ArtTableHeader
          v-model:columns="columnChecks"
          v-model:showSearchBar="showSearch"
          :loading="loading"
          @refresh="refreshData"
        >
          <template #left>
            <ElSpace wrap>
              <ElButton
                @click="handleBatchDelete"
                icon="ele-Delete"
                :disabled="!selectedRows.length"
                v-hasPermi="['monitor:operlog:remove']"
                type="danger"
                v-ripple
              >
                {{ t('system.operlog.delete') }}
              </ElButton>
              <ElButton @click="handleClean" icon="ele-Delete" v-hasPermi="['monitor:operlog:remove']" type="danger" v-ripple>
                {{ t('system.operlog.clear') }}
              </ElButton>
              <ElButton
                @click="handleExport"
                icon="ele-Download"
                v-hasPermi="['monitor:operlog:export']"
                :loading="exportLoading"
                v-ripple
              >
                {{ t('system.operlog.export') }}
              </ElButton>
            </ElSpace>
          </template>
        </ArtTableHeader>

        <!-- Table -->
        <ArtTable
          class="flex-1"
          :loading="loading"
          :data="data"
          :columns="columns"
          :pagination="pagination"
          @selection-change="handleSelectionChange"
          @pagination:size-change="handleSizeChange"
          @pagination:current-change="handleCurrentChange"
        >
          <template #businessType="{ row }">
            <el-tag :type="businessTypeTagType(row.businessType)" size="small" effect="light">
              {{ typeFormat(row) }}
            </el-tag>
          </template>
          <template #status="{ row }">
            <el-tag :type="row.status === 0 ? 'success' : 'danger'" size="small" effect="light">
              {{ statusFormat(row) }}
            </el-tag>
          </template>
          <template #costTime="{ row }">
            <span class="cost-time">{{ row.costTime || 0 }} ms</span>
          </template>
          <template #operation="{ row }">
            <div class="flex gap-2">
              <el-button link type="primary" @click="handleView(row)" v-hasPermi="['monitor:operlog:query']">
                {{ t('system.operlog.details') }}
              </el-button>
            </div>
          </template>
        </ArtTable>
      </ElCard>
    </div>

    <!-- Operation log detail dialog -->
    <el-dialog v-model="open" append-to-body :title="t('system.operlog.operationLogDetails')" width="60%" class="operlog-detail-dialog">
      <div class="detail-section">
        <div class="section-title">基本信息</div>
        <el-descriptions :column="2" border size="default">
          <el-descriptions-item :label="t('system.operlog.operationModule')">
            <span class="module-name">{{ form.title }}</span>
            <el-tag :type="businessTypeTagType(form.businessType)" size="small" style="margin-left: 8px;">
              {{ typeFormat(form) }}
            </el-tag>
          </el-descriptions-item>
          <el-descriptions-item :label="t('system.operlog.operationStatus')">
            <el-tag :type="form.status === 0 ? 'success' : 'danger'" size="small">
              {{ form.status === 0 ? t('system.operlog.operationStatusNormal') : t('system.operlog.operationStatusFailed') }}
            </el-tag>
          </el-descriptions-item>
          <el-descriptions-item :label="t('system.operlog.operator')">
            {{ form.operName }}
            <span v-if="form.deptName" class="dept-name">（{{ form.deptName }}）</span>
          </el-descriptions-item>
          <el-descriptions-item :label="t('system.operlog.operationTimestamp')">
            {{ parseTime(form.operTime) }}
          </el-descriptions-item>
          <el-descriptions-item :label="t('system.operlog.address')">
            {{ form.operIp }}
            <span v-if="form.operLocation" class="location">（{{ form.operLocation }}）</span>
          </el-descriptions-item>
          <el-descriptions-item label="耗时">
            <span class="cost-time">{{ form.costTime || 0 }} ms</span>
          </el-descriptions-item>
        </el-descriptions>
      </div>

      <div class="detail-section">
        <div class="section-title">请求信息</div>
        <el-descriptions :column="1" border size="default">
          <el-descriptions-item :label="t('system.operlog.requestAddress')">
            <code class="url-text">{{ form.operUrl }}</code>
          </el-descriptions-item>
          <el-descriptions-item :label="t('system.operlog.requestMethodLabel')">
            <el-tag type="primary" size="small">{{ form.requestMethod }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item :label="t('system.operlog.operationMethod')">
            <code class="method-text">{{ form.method }}</code>
          </el-descriptions-item>
        </el-descriptions>
      </div>

      <div class="detail-section" v-if="form.operParam">
        <div class="section-title">{{ t('system.operlog.requestParams') }}</div>
        <div class="json-box">
          <pre>{{ formatJson(form.operParam) }}</pre>
        </div>
      </div>

      <div class="detail-section" v-if="form.jsonResult">
        <div class="section-title">{{ t('system.operlog.responseParams') }}</div>
        <div class="json-box">
          <pre>{{ formatJson(form.jsonResult) }}</pre>
        </div>
      </div>

      <div class="detail-section" v-if="form.status === 1 && form.errorMsg">
        <div class="section-title error-title">{{ t('system.operlog.errorMessage') }}</div>
        <div class="error-box">
          <pre>{{ form.errorMsg }}</pre>
        </div>
      </div>

      <template #footer>
        <div class="dialog-footer">
          <el-button @click="open = false">{{ t('system.operlog.close') }}</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
  import { ref, reactive, onMounted } from 'vue'
  import { ElMessageBox } from 'element-plus'
  import { useI18n } from 'vue-i18n'
  import { useTable } from '@/hooks/core/useTable'
  import { cleanOperlog, delOperlog, exportOperlog, list, OperlogEntity } from '@/api/system/operlog'
  import { getDicts, DictDataEntity } from '@/api/system/dict/data'
  import { download, parseTime } from '@/utils/business'
  import { MessageUtil } from '@/utils/messageUtil'
  import OperlogSearch from './modules/operlog-search.vue'

  defineOptions({ name: 'ToolOperlog' })

  // i18n support
  const { t } = useI18n()

  // Selected rows
  const selectedRows = ref<any[]>([])

  // Search form
  const searchForm = ref({
    title: undefined,
    operName: undefined,
    businessType: undefined,
    status: undefined,
    dateRange: undefined
  })

  // Show search bar
  const showSearch = ref(true)

  // Export loading
  const exportLoading = ref(false)

  // Dialog related
  const open = ref(false)
  const form = reactive<OperlogEntity>({})

  // Dictionary options
  const typeOptions = ref<DictDataEntity[]>([])
  const statusOptions = ref<DictDataEntity[]>([])

  // useTable hook
  const {
    columns,
    columnChecks,
    data,
    loading,
    pagination,
    searchParams,
    resetSearchParams,
    handleSizeChange,
    handleCurrentChange,
    refreshData
  } = useTable({
    core: {
      apiFn: list,
      apiParams: {
        current: 1,
        size: 10,
        ...searchForm.value,
        params: {
          orderByColumn: 'id'
        }
      },
      columnsFactory: () => [
        { type: 'selection' },
        {
          prop: 'operTime',
          label: t('system.operlog.date'),
          minWidth: 170,
          formatter: (row: any) => parseTime(row?.operTime)
        },
        {
          prop: 'operName',
          label: t('system.operlog.operator'),
          showOverflowTooltip: true,
          minWidth: 100
        },
        {
          prop: 'title',
          label: t('system.operlog.systemModule'),
          minWidth: 120,
          showOverflowTooltip: true
        },
        {
          prop: 'businessType',
          label: t('system.operlog.operationType'),
          useSlot: true,
          minWidth: 100
        },
        {
          prop: 'status',
          label: t('system.operlog.state'),
          useSlot: true,
          minWidth: 90
        },
        {
          prop: 'costTime',
          label: '耗时',
          useSlot: true,
          minWidth: 90
        },
        {
          prop: 'operIp',
          label: t('system.operlog.address'),
          showOverflowTooltip: true,
          minWidth: 140
        },
        {
          prop: 'operation',
          label: t('system.operlog.operation'),
          useSlot: true,
          fixed: 'right',
          minWidth: 100
        }
      ]
    }
  })

  // Load dictionary data
  const loadDictData = async () => {
    try {
      const typeResponse = await getDicts('sys_oper_type')
      typeOptions.value = typeResponse || []

      const statusResponse = await getDicts('sys_common_status')
      statusOptions.value = statusResponse || []
    } catch (error) {
      console.error('获取字典数据失败:', error)
    }
  }

  // Format status
  const statusFormat = (row: any) => {
    const dict = statusOptions.value.find((item) => item.dictValue === String(row.status))
    return dict?.dictLabel || row.status
  }

  // Format type
  const typeFormat = (row: any) => {
    const dict = typeOptions.value.find((item) => item.dictValue === String(row.businessType))
    return dict?.dictLabel || t('system.operlog.other')
  }

  // Business type tag color
  const businessTypeTagType = (businessType: number) => {
    const typeMap: Record<number, string> = {
      0: 'primary',   // 其它
      1: 'success',   // 新增
      2: 'warning',   // 修改
      3: 'danger',    // 删除
      4: 'info',      // 授权
      5: '',          // 导出
      6: '',          // 导入
      7: 'danger',    // 强退
      8: 'info',      // 生成代码
      9: 'warning',   // 清空数据
    }
    return typeMap[businessType] || 'info'
  }

  // Format JSON string
  const formatJson = (jsonStr: string) => {
    if (!jsonStr) return ''
    try {
      return JSON.stringify(JSON.parse(jsonStr), null, 2)
    } catch {
      return jsonStr
    }
  }

  // Search handling
  const handleSearch = (params: Record<string, any>) => {
    // Handle dateRange
    if (params.dateRange && params.dateRange.length === 2) {
      params.beginTime = params.dateRange[0]
      params.endTime = params.dateRange[1]
      delete params.dateRange
    }
    Object.assign(searchParams, params)
    refreshData()
  }

  // View details
  const handleView = (row: OperlogEntity) => {
    Object.assign(form, row)
    open.value = true
  }

  // Batch delete
  const handleBatchDelete = () => {
    const ids = selectedRows.value.map((item) => item.id).join(',')
    handleDelete(ids)
  }

  // Delete operlog (batch or single)
  const handleDelete = (ids: any) => {
    ElMessageBox.confirm(
      t('system.operlog.confirmDeleteLogNumber') + `"${ids}"` + t('system.operlog.dataItem'),
      t('system.operlog.warning'),
      {
        confirmButtonText: t('system.operlog.confirm'),
        cancelButtonText: t('system.operlog.cancel'),
        type: 'warning'
      }
    )
      .then(async () => {
        try {
          await delOperlog(ids)
          MessageUtil.success(t('system.operlog.deleteSuccess'))
          await refreshData()
        } catch (error) {
          console.error('删除失败:', error)
        }
      })
      .catch(() => {})
  }

  // Clean all logs
  const handleClean = () => {
    ElMessageBox.confirm(t('system.operlog.confirmClearLogs'), t('system.operlog.warning'), {
      confirmButtonText: t('system.operlog.confirm'),
      cancelButtonText: t('system.operlog.cancel'),
      type: 'warning'
    })
      .then(async () => {
        try {
          await cleanOperlog()
          MessageUtil.success(t('system.operlog.clearSuccess'))
          await refreshData()
        } catch (error) {
          console.error('清空失败:', error)
        }
      })
      .catch(() => {})
  }

  // Export
  const handleExport = () => {
    ElMessageBox.confirm(t('system.operlog.confirmExportLogs'), t('system.operlog.warning'), {
      confirmButtonText: t('system.operlog.confirm'),
      cancelButtonText: t('system.operlog.cancel'),
      type: 'warning'
    })
      .then(async () => {
        try {
          exportLoading.value = true
          const response = await exportOperlog(searchParams)
          download(response, t('system.operlog.operationLogs'))
        } catch (error) {
          console.error('导出失败:', error)
        } finally {
          exportLoading.value = false
        }
      })
      .catch(() => {})
  }

  // Table row selection change
  const handleSelectionChange = (selection: any[]): void => {
    selectedRows.value = selection
  }

  onMounted(() => {
    loadDictData()
  })
</script>

<style scoped lang="scss">
  .operlog-page {
    padding: 16px;
  }

  .cost-time {
    color: var(--art-gray-500);
    font-family: 'Courier New', monospace;
    font-size: 13px;
  }

  .operlog-detail-dialog {
    :deep(.el-dialog__body) {
      padding-top: 10px;
    }
  }

  .detail-section {
    margin-bottom: 24px;

    &:last-child {
      margin-bottom: 0;
    }
  }

  .section-title {
    font-size: 15px;
    font-weight: 600;
    color: var(--art-gray-800);
    margin-bottom: 12px;
    padding-left: 10px;
    border-left: 3px solid var(--el-color-primary);
    line-height: 1.4;
  }

  .error-title {
    color: var(--el-color-danger);
    border-left-color: var(--el-color-danger);
  }

  .module-name {
    font-weight: 500;
  }

  .dept-name,
  .location {
    color: var(--art-gray-500);
    font-size: 13px;
  }

  .url-text,
  .method-text {
    background: var(--art-gray-50);
    padding: 2px 6px;
    border-radius: 4px;
    font-size: 13px;
    word-break: break-all;
  }

  .json-box {
    background: var(--art-gray-50);
    border-radius: 8px;
    padding: 16px;
    max-height: 300px;
    overflow-y: auto;
    border: 1px solid var(--art-gray-100);

    pre {
      margin: 0;
      font-family: 'Courier New', Consolas, Monaco, monospace;
      font-size: 13px;
      line-height: 1.6;
      color: var(--art-gray-700);
      white-space: pre-wrap;
      word-break: break-all;
    }
  }

  .error-box {
    background: #fef0f0;
    border-radius: 8px;
    padding: 16px;
    max-height: 300px;
    overflow-y: auto;
    border: 1px solid #fbc4c4;

    pre {
      margin: 0;
      font-family: 'Courier New', Consolas, Monaco, monospace;
      font-size: 13px;
      line-height: 1.6;
      color: var(--el-color-danger);
      white-space: pre-wrap;
      word-break: break-all;
    }
  }
</style>
