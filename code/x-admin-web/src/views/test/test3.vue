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
          {{ scope.row.id }}
        </template>
      </el-table-column>
      <el-table-column label="Username">
        <template slot-scope="scope">
          {{ scope.row.userId }}
        </template>
      </el-table-column>
<el-table-column label="机器人回复">
  <template slot-scope="scope">
    <div v-if="!isRowExpanded(scope.row)" class="ellipsis-text">
      {{ getShortText(scope.row.prompt, 10) }}
      <span v-if="isTextOverflow(scope.row.prompt)" class="expand-link" @click="toggleRow(scope.row)">展开</span>
    </div>
    <div v-else>
      {{ scope.row.prompt }}
      <span class="collapse-link" @click="toggleRow(scope.row)">收起</span>
    </div>
  </template>
</el-table-column>
      <el-table-column label="用户输入">
        <template slot-scope="scope">
          {{ scope.row.response }}
        </template>
      </el-table-column>
      <el-table-column label="Reply Time">
        <template slot-scope="scope">
          {{ scope.row.requestTime }}
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
        pageSizes: [5, 10, 30],
        total: 50
      },
      expandedRows: []
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.listLoading = true

      const params = {
        username: this.search.username,
        startDate: this.search.startDate,
        endDate: this.search.endDate,
        page: this.pagination.currentPage,
        size: this.pagination.pageSize
      };

      axios.get('http://localhost:9999/api/chat-logs', {
        params: params
      })
        .then(response => {
          this.list = response.data
          this.listLoading = false
        })
        .catch(error => {
          console.error(error)
          this.listLoading = false
        })
    },
    searchLogs() {
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
    },
     isTextOverflow(text) {
        return text.length > 10; // 这里的10是指定的字数限制
      },
    toggleRow(row) {
      if (this.isRowExpanded(row)) {
        this.expandedRows = this.expandedRows.filter(item => item !== row)
      } else {
        this.expandedRows.push(row)
      }
    },
    getShortText(text, maxLength) {
      if (text.length <= maxLength) {
        return text
      } else {
        return text.slice(0, maxLength) + '...'
      }
    },
    isRowExpanded(row) {
      return this.expandedRows.includes(row)
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

.ellipsis-text {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.expand-link,
.collapse-link {
  cursor: pointer;
  color: blue;
  margin-left: 5px;
}
</style>
