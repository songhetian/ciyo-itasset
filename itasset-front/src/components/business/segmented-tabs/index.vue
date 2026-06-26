<template>
  <div class="art-segmented-tabs-container">
    <div class="art-segmented-tabs" ref="tabsRef">
      <div
        v-for="item in options"
        :key="item.value"
        :ref="(el) => setItemRef(el as HTMLElement, item.value)"
        class="tab-item"
        :class="{ 'is-active': modelValue === item.value }"
        @click="handleToggle(item.value)"
      >
        <div class="tab-content">
          <el-icon v-if="item.icon" class="tab-icon">
            <ArtSvgIcon v-if="typeof item.icon === 'string'" :icon="item.icon" />
            <component v-else :is="item.icon" />
          </el-icon>
          <span class="tab-label">{{ item.label }}</span>
        </div>
        <div class="tab-indicator" :class="{ 'is-active': modelValue === item.value }"></div>
      </div>
      <div class="tabs-track">
        <div class="track-glider" :style="gliderStyle"></div>
      </div>
    </div>

    <div class="art-segmented-content">
      <template v-for="item in options" :key="item.value">
        <Transition name="content-slide">
          <div v-if="$slots[item.value]" v-show="modelValue === item.value">
            <slot :name="item.value" :active="modelValue === item.value"></slot>
          </div>
        </Transition>
      </template>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { type Component, nextTick, onMounted, onUnmounted, provide, reactive, ref, toRef, watch } from 'vue'
  import ArtSvgIcon from '@/components/core/base/art-svg-icon/index.vue'

  defineOptions({ name: 'ArtSegmentedTabs' })

  interface TabOption {
    label: string
    value: string
    icon?: string | Component
  }

  interface Props {
    modelValue: string
    options: TabOption[]
  }

  const props = defineProps<Props>()
  const emit = defineEmits(['update:modelValue', 'change'])

  provide('segmented-tabs-active', toRef(props, 'modelValue'))

  const tabsRef = ref<HTMLElement>()
  const itemRefs = ref<Map<string, HTMLElement>>(new Map())
  const gliderStyle = reactive({
    width: '0px',
    left: '0px'
  })

  const setItemRef = (el: HTMLElement, value: string) => {
    if (el) {
      itemRefs.value.set(value, el)
    }
  }

  const updateGlider = () => {
    const activeEl = itemRefs.value.get(props.modelValue)
    if (activeEl) {
      const { offsetLeft, offsetWidth } = activeEl
      const labelWidth = Math.min(offsetWidth * 0.6, 60)
      gliderStyle.left = `${offsetLeft + (offsetWidth - labelWidth) / 2}px`
      gliderStyle.width = `${labelWidth}px`
    }
  }

  const handleToggle = (value: string) => {
    if (props.modelValue === value) return
    emit('update:modelValue', value)
    emit('change', value)
  }

  watch(
    () => props.modelValue,
    () => {
      nextTick(updateGlider)
    }
  )

  onMounted(() => {
    setTimeout(updateGlider, 100)
    window.addEventListener('resize', updateGlider)
  })

  onUnmounted(() => {
    window.removeEventListener('resize', updateGlider)
  })
</script>

<style scoped lang="scss">
  .art-segmented-tabs {
    display: flex;
    align-items: center;
    gap: 0;
    padding: 0 4px;
    position: relative;
    min-height: 48px;
    border-bottom: 1px solid var(--art-gray-200);

    :global(.dark) &,
    [data-theme='dark'] & {
      border-bottom-color: rgba(255, 255, 255, 0.08);
    }
  }

  .tabs-track {
    position: absolute;
    bottom: -1px;
    left: 0;
    right: 0;
    height: 2px;
    pointer-events: none;
  }

  .track-glider {
    position: absolute;
    bottom: 0;
    height: 2px;
    background: linear-gradient(
      90deg,
      var(--el-color-primary) 0%,
      color-mix(in srgb, var(--el-color-primary) 70%, #fff) 100%
    );
    border-radius: 2px 2px 0 0;
    transition:
      left 0.4s cubic-bezier(0.34, 1.56, 0.64, 1),
      width 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
    box-shadow: 0 -2px 8px color-mix(in srgb, var(--el-color-primary) 30%, transparent);
  }

  .tab-item {
    position: relative;
    z-index: 1;
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 0 16px;
    height: 48px;
    cursor: pointer;
    user-select: none;
    transition: background-color 0.2s ease;

    &::before {
      content: '';
      position: absolute;
      top: 8px;
      bottom: 8px;
      left: 4px;
      right: 4px;
      border-radius: 8px;
      background: transparent;
      transition: background-color 0.2s ease;
    }

    &:not(.is-active):hover {
      &::before {
        background: var(--art-gray-50);
      }

      .tab-content {
        transform: translateY(-1px);
      }

      .tab-label {
        color: var(--art-gray-800);
      }

      .tab-icon {
        color: var(--art-gray-600);
      }
    }

    :global(.dark) &,
    [data-theme='dark'] & {
      &:not(.is-active):hover {
        &::before {
          background: rgba(255, 255, 255, 0.04);
        }

        .tab-label {
          color: var(--art-gray-200);
        }

        .tab-icon {
          color: var(--art-gray-400);
        }
      }
    }

    &.is-active {
      .tab-content {
        transform: translateY(-1px);
      }

      .tab-label {
        color: var(--el-color-primary);
        font-weight: 600;
      }

      .tab-icon {
        color: var(--el-color-primary);
      }
    }

    &:active .tab-content {
      transform: translateY(0);
    }
  }

  .tab-content {
    position: relative;
    z-index: 1;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: transform 0.2s cubic-bezier(0.4, 0, 0.2, 1);
  }

  .tab-icon {
    font-size: 18px;
    color: var(--art-gray-500);
    transition: color 0.2s ease;

    :global(.dark) &,
    [data-theme='dark'] & {
      color: var(--art-gray-400);
    }
  }

  .tab-label {
    font-size: 14px;
    font-weight: 500;
    color: var(--art-gray-600);
    white-space: nowrap;
    letter-spacing: 0.01em;
    transition: color 0.2s ease, font-weight 0.15s ease;

    :global(.dark) &,
    [data-theme='dark'] & {
      color: var(--art-gray-400);
    }
  }

  .tab-indicator {
    position: absolute;
    bottom: -1px;
    left: 50%;
    width: 0;
    height: 2px;
    background: var(--el-color-primary);
    border-radius: 2px 2px 0 0;
    transform: translateX(-50%);
    transition: width 0.3s ease, opacity 0.3s ease;
    opacity: 0;

    &.is-active {
      width: 40%;
      opacity: 1;
    }
  }

  .art-segmented-content {
    margin-top: 24px;
    position: relative;
    min-height: 200px;
  }

  .content-slide-enter-active {
    transition: opacity 0.35s ease-out, transform 0.35s cubic-bezier(0.4, 0, 0.2, 1);
  }

  .content-slide-leave-active {
    transition: opacity 0.2s ease-in, transform 0.2s ease-in;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 0;
    pointer-events: none;
  }

  .content-slide-enter-from {
    opacity: 0;
    transform: translateY(12px);
  }

  .content-slide-leave-to {
    opacity: 0;
    transform: translateY(-8px);
  }

  @media (max-width: 768px) {
    .art-segmented-tabs {
      min-height: 44px;
      padding: 0 2px;
    }

    .tab-item {
      padding: 0 8px;
      height: 44px;

      &::before {
        top: 6px;
        bottom: 6px;
        left: 2px;
        right: 2px;
        border-radius: 6px;
      }
    }

    .tab-label {
      font-size: 13px;
    }

    .tab-icon {
      font-size: 18px;
    }

    .tab-content {
      gap: 6px;
    }

    .art-segmented-content {
      margin-top: 16px;
    }
  }

  @media (max-width: 640px) {
    .art-segmented-tabs {
      min-height: 40px;
    }

    .tab-item {
      height: 40px;
      padding: 0 6px;
    }

    .tab-label {
      font-size: 0;
    }

    .tab-icon {
      font-size: 20px;
    }

    .tab-content {
      gap: 0;
    }

    .art-segmented-content {
      margin-top: 12px;
    }
  }

  @media (max-width: 480px) {
    .art-segmented-tabs {
      min-height: 36px;
    }

    .tab-item {
      height: 36px;
      padding: 0 4px;
    }

    .tab-icon {
      font-size: 18px;
    }
  }
</style>
