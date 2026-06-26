<template>
  <div class="art-empty-state">
    <div class="art-empty-illustration">
      <svg viewBox="0 0 200 160" class="art-empty-svg" :class="type">
        <ellipse cx="100" cy="145" rx="60" ry="8" class="art-empty-shadow" />
        <g class="art-empty-box">
          <path d="M30,60 L100,35 L170,60 L170,130 L100,155 L30,130 Z" class="art-empty-box-back" />
          <path d="M100,35 L100,95 M30,60 L100,95 L170,60" class="art-empty-box-lines" />
          <path d="M30,60 L30,130 L100,155 L100,95 Z" class="art-empty-box-left" />
          <path d="M170,60 L170,130 L100,155 L100,95 Z" class="art-empty-box-right" />
        </g>
        <g class="art-empty-sparkles" v-if="type === 'empty'">
          <circle cx="55" cy="45" r="2" class="sparkle s1" />
          <circle cx="145" cy="50" r="1.5" class="sparkle s2" />
          <circle cx="40" cy="90" r="1.5" class="sparkle s3" />
          <circle cx="160" cy="100" r="2" class="sparkle s4" />
        </g>
        <g v-if="type === 'search'" class="art-empty-magnifier">
          <circle cx="140" cy="75" r="20" class="magnifier-ring" />
          <line x1="154" y1="89" x2="165" y2="100" class="magnifier-handle" />
        </g>
        <g v-if="type === 'error'" class="art-empty-error">
          <circle cx="100" cy="75" r="28" class="error-circle" />
          <line x1="92" y1="67" x2="108" y2="83" class="error-line" />
          <line x1="108" y1="67" x2="92" y2="83" class="error-line" />
        </g>
      </svg>
    </div>
    <h3 class="art-empty-title">{{ title }}</h3>
    <p class="art-empty-desc" v-if="description">{{ description }}</p>
    <div class="art-empty-action" v-if="$slots.default">
      <slot></slot>
    </div>
  </div>
</template>

<script setup lang="ts">
  defineOptions({ name: 'ArtEmptyState' })

  interface EmptyStateProps {
    type?: 'empty' | 'search' | 'error'
    title?: string
    description?: string
  }

  withDefaults(defineProps<EmptyStateProps>(), {
    type: 'empty',
    title: '暂无数据',
    description: ''
  })
</script>

<style scoped lang="scss">
.art-empty-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 60px 20px;
  text-align: center;
}

.art-empty-illustration {
  margin-bottom: 24px;
}

.art-empty-svg {
  width: 200px;
  height: 160px;

  &.empty {
    .art-empty-box-back { fill: var(--art-gray-100); }
    .art-empty-box-left { fill: var(--art-gray-200); }
    .art-empty-box-right { fill: var(--art-gray-150, #e8eaec); }
    .art-empty-box-lines { stroke: var(--art-gray-300); fill: none; stroke-width: 1; }
    .art-empty-shadow { fill: var(--art-gray-200); opacity: 0.5; }
  }

  &.search {
    .art-empty-box-back { fill: var(--art-gray-100); }
    .art-empty-box-left { fill: var(--art-gray-200); }
    .art-empty-box-right { fill: var(--art-gray-150, #e8eaec); }
    .art-empty-box-lines { stroke: var(--art-gray-300); fill: none; stroke-width: 1; }
    .art-empty-shadow { fill: var(--art-gray-200); opacity: 0.5; }
    .magnifier-ring { stroke: var(--el-color-primary); stroke-width: 3; fill: none; }
    .magnifier-handle { stroke: var(--el-color-primary); stroke-width: 3; stroke-linecap: round; }
  }

  &.error {
    .art-empty-box-back { fill: var(--art-gray-100); }
    .art-empty-box-left { fill: var(--art-gray-200); }
    .art-empty-box-right { fill: var(--art-gray-150, #e8eaec); }
    .art-empty-box-lines { stroke: var(--art-gray-300); fill: none; stroke-width: 1; }
    .art-empty-shadow { fill: var(--art-gray-200); opacity: 0.5; }
    .error-circle { fill: var(--el-color-danger); }
    .error-line { stroke: #fff; stroke-width: 2.5; stroke-linecap: round; }
  }
}

.art-empty-box {
  animation: float 3s ease-in-out infinite;
}

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-8px); }
}

.sparkle {
  fill: var(--el-color-primary);
  opacity: 0.6;
}

.s1 { animation: sparkle 2s ease-in-out infinite; }
.s2 { animation: sparkle 2s ease-in-out infinite 0.5s; }
.s3 { animation: sparkle 2s ease-in-out infinite 1s; }
.s4 { animation: sparkle 2s ease-in-out infinite 1.5s; }

@keyframes sparkle {
  0%, 100% { opacity: 0.2; transform: scale(0.8); }
  50% { opacity: 0.8; transform: scale(1.2); }
}

.art-empty-title {
  font-size: 16px;
  font-weight: 500;
  color: var(--art-gray-700);
  margin: 0 0 8px 0;
}

.art-empty-desc {
  font-size: 13px;
  color: var(--art-gray-500);
  margin: 0 0 20px 0;
  max-width: 320px;
  line-height: 1.6;
}

.art-empty-action {
  margin-top: 8px;
}

@media (max-width: 768px) {
  .art-empty-state {
    padding: 40px 16px;
  }

  .art-empty-svg {
    width: 160px;
    height: 128px;
  }

  .art-empty-illustration {
    margin-bottom: 16px;
  }

  .art-empty-title {
    font-size: 15px;
  }

  .art-empty-desc {
    font-size: 12px;
  }
}

@media (prefers-reduced-motion: reduce) {
  .art-empty-box,
  .sparkle {
    animation: none;
  }
}
</style>
