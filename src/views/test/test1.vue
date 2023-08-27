<template>
  <div>
    <div v-if="!isExpanded">
      <span v-if="!backendData">{{ placeholderText }}</span>
      <span v-else>{{ '这是从后端获取的数据：' + backendData }}</span>
      <a @click="isExpanded = true" class="expand-link" v-if="!backendData">展开</a>
      <a @click="isExpanded = true" class="expand-link" v-else>查看更多</a>
    </div>
    <div v-else>
      {{ '这是从后端获取的数据：' + backendData }}
      <a @click="isExpanded = false" class="collapse-link">收起</a>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isExpanded: false,
      placeholderText: '加载中...', // 占位文字
      backendData: '' // 从后端获取的数据
    };
  },
  created() {
    // 在created钩子中，可以使用异步请求从后端获取数据并赋值给backendData属性
    // 示例中使用setTimeout模拟异步请求
    setTimeout(() => {
      this.backendData = '这是从后端获取的数据';
    }, 2000);
  }
};
</script>

<style>
.expand-link,
.collapse-link {
  cursor: pointer;
  color: blue;
  text-decoration: underline;
}
</style>
