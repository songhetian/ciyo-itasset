import { ElMessage, ElMessageBox } from 'element-plus'

interface RetDataMap {
  string: string
  json: string
  object: {
    code: number
    message: string
  }
}

function parseError<K extends keyof RetDataMap>(error: any, type: K): RetDataMap[K] {
  const retData = {
    code: -1,
    message: 'error'
  }

  const res = error.response || { data: error }
  if (res && res.data) {
    const { status, code, message } = res.data
    retData.code = status || code || -1
    retData.message = message || res.data
  }

  const ret = type === 'string' ? retData.message : type === 'json' ? JSON.stringify(retData) : retData

  return ret as RetDataMap[K]
}

export const MessageUtil = {
  format(error: any) {
    return parseError(error, 'string')
  },
  formatJson(error: any) {
    return parseError(error, 'json')
  },
  formatObject(error: any) {
    return parseError(error, 'object')
  },

  success(message: string, showClose = true, duration = 1000) {
    ElMessage({
      type: 'success',
      showClose,
      message,
      duration
    })
  },

  warning(message: string, showClose = true) {
    ElMessage({
      type: 'warning',
      showClose,
      message
    })
  },

  error(message: string, showClose = true) {
    ElMessage({
      type: 'error',
      showClose,
      message
    })
  }
}

export const MessageBoxUtil = {
  confirm(message: string, callback: Function, title = '') {
    ElMessageBox.confirm(message, title, {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
      buttonSize: 'default',
      appendTo: document.body,
      dangerouslyUseHTMLString: true
    })
      .then(() => {
        callback()
      })
      .catch(() => {})
  },
  async confirmAsync(
    message: string,
    callback: Function,
    options?: {
      title?: string
      success?: Function
      error?: Function
    }
  ) {
    const opt = {
      title: '',
      ...(options || {})
    }
    await ElMessageBox.confirm(message, opt.title, {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning',
      dangerouslyUseHTMLString: true,
      beforeClose: async (action, instance, done) => {
        if (action === 'confirm') {
          instance.confirmButtonLoading = true
          instance.confirmButtonText = '执行中...'

          try {
            await callback()
            done()
          } catch (error) {
            MessageUtil.error(MessageUtil.format(error))
          } finally {
            instance.confirmButtonLoading = false
            instance.confirmButtonText = '确定'
          }
        } else {
          done()
        }
      }
    })
      .then(() => {
        if (typeof opt.success === 'function') {
          opt.success()
        }
      })
      .catch(() => {
        if (typeof opt.error === 'function') {
          opt.error()
        }
      })
  },

  async confirmDelete(
    deleteAction: () => Promise<any>,
    options?: {
      title?: string
      message?: string
      itemName?: string
      count?: number
      onSuccess?: () => void
    }
  ) {
    const {
      title = '删除确认',
      itemName = '数据',
      count,
      onSuccess
    } = options || {}

    let message = options?.message || ''
    if (!message) {
      if (count !== undefined && count > 0) {
        message = `确定要删除选中的 <strong>${count}</strong> 条${itemName}吗？`
      } else {
        message = `确定要删除该${itemName}吗？`
      }
      message += '<br/><span style="color: #909399; font-size: 13px;">此操作无法撤销，请谨慎操作。</span>'
    }

    await ElMessageBox.confirm(message, title, {
      confirmButtonText: '确认删除',
      cancelButtonText: '取消',
      type: 'warning',
      dangerouslyUseHTMLString: true,
      confirmButtonClass: 'el-button--danger',
      beforeClose: async (action, instance, done) => {
        if (action === 'confirm') {
          instance.confirmButtonLoading = true
          instance.confirmButtonText = '删除中...'

          try {
            await deleteAction()
            done()
            MessageUtil.success('删除成功')
            onSuccess?.()
          } catch (error) {
            MessageUtil.error(MessageUtil.format(error))
          } finally {
            instance.confirmButtonLoading = false
            instance.confirmButtonText = '确认删除'
          }
        } else {
          done()
        }
      }
    }).catch(() => {})
  }
}
