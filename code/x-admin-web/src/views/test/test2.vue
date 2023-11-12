<template>
  <div style="margin: 20px;">
    <SelectComp :select="select" @callback="setData" @click="loadData"></SelectComp>
    <SelectComp :select="selectC"></SelectComp>
  </div>
</template>

<script>
import SelectComp from "./SelectComp";
import axios from 'axios';

export default {
  name: "SelectTest",
  components: {
    SelectComp,
  },
  data() {
    return {
      data: {},
      selectC: {
        selectResult: "",
        name: "",
        data: [],
      },
      select: {
        selectResult: "",
        name: "",
        data: [],
        change: (data) => {
          console.log(data);
          this.selectC.data = data;
        },
      },
    };
  },
  methods: {
    loadData() {
      axios.get("http://192.168.26.1:9999/user/username").then((response) => {
        this.select.name = "用户名"; // 设置Select的名称为"用户名"
        this.select.selectResult = response.data[0]; // 设置默认选中的用户名为第一个
        this.select.data = response.data.map((username) => ({
          value: username,
          label: username,
        }));
      });
    },
    setData(data) {
      console.log(data);
    },
  },
  mounted() {
    // 在组件挂载后不立即发送请求，而是等待点击事件触发
  },
};
</script>

<style scoped></style>