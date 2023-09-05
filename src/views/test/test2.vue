<template>
  <div class="app-container">
    <el-table
      v-loading="listLoading"
      :data="list"
      element-loading-text="Loading"
      border
      fit
      highlight-current-row
    >
      <el-table-column align="center" label="User ID" width="95">
        <template slot-scope="scope">
          {{ scope.row.id }}
        </template>
      </el-table-column>
      <el-table-column label="Username">
        <template slot-scope="scope">
          {{ scope.row.userId }}
        </template>
      </el-table-column>
      <el-table-column label="User Input">
        <template slot-scope="scope">
          {{ scope.row.response }}
        </template>
      </el-table-column>
      <el-table-column label="Robot Reply">
        <template slot-scope="scope">
          {{ scope.row.prompt }}
        </template>
      </el-table-column>
      <el-table-column label="Reply Time">
        <template slot-scope="scope">
          {{ scope.row.requestTime }}
        </template>
      </el-table-column>
      <el-table-column label="Resolved">
        <template slot-scope="scope">
          {{ scope.row.chatType }}
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { getChatLog } from '@/api/chatlog'

export default {
  data() {
    return {
      list: [],
      listLoading: false
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.listLoading = true
      getChatLog(1, 5) // 调用 getChatLog 方法获取聊天记录数据，传递页码和每页大小作为参数
        .then(response => {
          this.list = response.data
          this.listLoading = false
        })
        .catch(error => {
          console.error('Error fetching chat logs:', error)
          this.listLoading = false
        })
    }
  }
}
</script>
