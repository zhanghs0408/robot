<template>
  <div class="app-container">
    <el-form :inline="true" class="search-form">
      <el-form-item label="Username">
        <el-input v-model="search.username" placeholder="Enter username"></el-input>
      </el-form-item>
      <el-form-item label="Start Date">
        <el-date-picker v-model="search.startDate" type="date" placeholder="Select date"></el-date-picker>
      </el-form-item>
      <el-form-item label="End Date">
        <el-date-picker v-model="search.endDate" type="date" placeholder="Select date"></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="searchLogs">Search</el-button>
      </el-form-item>
    </el-form>

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

    <div class="pagination-container">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="pagination.currentPage"
        :page-sizes="pagination.pageSizes"
        :page-size="pagination.pageSize"
        :total="pagination.total"
        layout="total, sizes, prev, pager, next, jumper"
        class="pagination"
      ></el-pagination>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import userAPI from '@/api/log'
export default {
  data() {
    return {
      list: [],
      listLoading: false,
      search: {
        username: '',
        startDate: '',
        endDate: ''
      },
      pagination: {
        currentPage: 1,
        pageSize: 10,
        pageSizes: [10, 20, 30],
        total: 0
      }
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.listLoading = true

      // 使用 params 来发送请求
  const params = {
    username: this.search.username,
    startDate: this.search.startDate,
    endDate: this.search.endDate,
    page: this.pagination.currentPage, // 从分页对象中获取当前页
    size: this.pagination.pageSize // 从分页对象中获取每页大小
  };

      axios.get('http://localhost:9999/api/chat-logs', {
        params: params
      })
        .then(response => {
          // 请求成功后的处理
          this.list = response.data
          this.listLoading = false
        })
        .catch(error => {
          // 请求发生错误的处理
          console.error(error)
          this.listLoading = false
        })
    },
    searchLogs() {
      // 重新从第一页开始查询
      this.pagination.currentPage = 1
      this.fetchData()
    },
    handleSizeChange(pageSize) {
      this.pagination.pageSize = pageSize
      this.fetchData()
    },
    handleCurrentChange(currentPage) {
      this.pagination.currentPage = currentPage
      this.fetchData()
    }
  }
}
</script>

<style>
.app-container {
  padding: 20px;
}
.search-form {
  margin-bottom: 20px;
}
.pagination-container {
  margin-top: 20px;
}
.pagination {
  text-align: right;
}
</style>
