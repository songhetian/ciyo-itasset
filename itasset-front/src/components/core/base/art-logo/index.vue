<!-- 系统logo -->
<template>
  <div class="art-logo-wrapper flex-cc" :style="wrapperStyle">
    <img
      v-if="logoImg"
      :style="logoStyle"
      :src="logoImg"
      alt="logo"
      class="logo-img"
      :width="props.size"
      :height="props.size"
    />
    <div v-else class="logo-placeholder" :style="placeholderStyle">
      <span class="logo-text">{{ logoText }}</span>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { computed } from 'vue'
  import { useSystemStore } from '@/store/modules/system'

  defineOptions({ name: 'ArtLogo' })

  interface Props {
    /** logo 大小 */
    size?: number | string
  }

  const props = withDefaults(defineProps<Props>(), {
    size: 36
  })

  const systemStore = useSystemStore()
  const { systemInfo } = storeToRefs(systemStore)

  const logoImg = computed(() => systemInfo.value.logoImg)

  const logoText = computed(() => {
    const name = systemInfo.value.name || '雷犀IT资产'
    if (name.length <= 4) return name
    return name.charAt(0) + name.charAt(1)
  })

  const logoStyle = computed(() => ({
    width: typeof props.size === 'number' ? `${props.size}px` : props.size,
    height: typeof props.size === 'number' ? `${props.size}px` : props.size
  }))

  const wrapperStyle = computed(() => ({
    width: typeof props.size === 'number' ? `${props.size}px` : props.size,
    height: typeof props.size === 'number' ? `${props.size}px` : props.size
  }))

  const placeholderStyle = computed(() => {
    const size = typeof props.size === 'number' ? props.size : 36
    const fontSize = Math.max(size * 0.35, 12)
    return {
      width: `${size}px`,
      height: `${size}px`,
      fontSize: `${fontSize}px`
    }
  })
</script>

<style lang="scss" scoped>
  .art-logo-wrapper {
    flex-shrink: 0;
  }

  .logo-img {
    object-fit: contain;
    display: block;
  }

  .logo-placeholder {
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 10px;
    background: linear-gradient(135deg, #6699ff 0%, #165dff 50%, #003399 100%);
    color: #fff;
    font-weight: 700;
    letter-spacing: 0.5px;
    box-shadow: 0 4px 12px rgba(22, 93, 255, 0.25);
    transition: transform 0.2s ease, box-shadow 0.2s ease;

    &:hover {
      transform: translateY(-1px);
      box-shadow: 0 6px 16px rgba(22, 93, 255, 0.35);
    }
  }

  .logo-text {
    user-select: none;
  }
</style>
