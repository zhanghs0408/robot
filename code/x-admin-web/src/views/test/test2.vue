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
          {{ scope.row.userId }}
        </template>
      </el-table-column>
      <el-table-column label="Username">
        <template slot-scope="scope">
          {{ scope.row.username }}
        </template>
      </el-table-column>
      <el-table-column label="User Input">
        <template slot-scope="scope">
          {{ scope.row.userInput }}
        </template>
      </el-table-column>
      <el-table-column label="Robot Reply">
        <template slot-scope="scope">
          {{ scope.row.robotReply }}
        </template>
      </el-table-column>
      <el-table-column label="Reply Time">
        <template slot-scope="scope">
          {{ scope.row.replyTime }}
        </template>
      </el-table-column>
      <el-table-column label="Resolved">
        <template slot-scope="scope">
          <span>{{ scope.row.resolved ? 'Yes' : 'No' }}</span>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import axios from 'axios'
import userAPI from '@/api/log'
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
      axios.get('http://localhost:9999/api/chat-logs') // 假设后端提供了 '/api/chat-logs' 接口用于获取聊天记录数据
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
