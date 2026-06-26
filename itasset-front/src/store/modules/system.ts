import { defineStore } from 'pinia'
import { ref } from 'vue'
import { getSystemInfoConfig } from '@/api/system/config'
import { SystemBasicConfig } from '@/types/config'

export const useSystemStore = defineStore(
  'systemStore',
  () => {
    const systemInfo = ref<SystemBasicConfig>({
      name: '雷犀IT资产管理系统',
      description: '专业的企业资产管理系统',
      logoImg: '',
      favicon: '',
      copyright: '<p>Copyright © 2018-2026 雷犀 All Rights Reserved.</p>',
      backgroundImage: ''
    })

    const initSystemConfig = async () => {
      try {
        const res: any = await getSystemInfoConfig()
        if (typeof res === 'string') {
          const binaryString = atob(res)
          const bytes = new Uint8Array(binaryString.length)
          for (let i = 0; i < binaryString.length; i++) {
            bytes[i] = binaryString.charCodeAt(i)
          }
          const decoded = new TextDecoder('UTF-8').decode(bytes)
          systemInfo.value = JSON.parse(decoded)
        } else {
          systemInfo.value = res
        }
      } catch (error) {
        console.error('Failed to fetch system config:', error)
      }
    }

    return {
      systemInfo,
      initSystemConfig
    }
  },
  {
    persist: {
      key: 'systemInfoConfig',
      storage: sessionStorage
    }
  }
)
