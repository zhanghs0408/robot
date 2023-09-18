<template>
  <div>
    <!-- 搜索栏 -->
    <el-card id="search">
      <el-row>
        <el-col :span="20">
          <el-input
            v-model="searchModel.id"
            placeholder="ID"
            clearable
          ></el-input>
          <el-button
            @click="getErrorUserList"
            type="primary"
            round
            icon="el-icon-search"
            >查询</el-button
          >
        </el-col>
        <el-col :span="4" align="right">
          <el-button
            @click="openEditUI(null)"
            type="primary"
            icon="el-icon-plus"
            circle
          ></el-button>
        </el-col>
      </el-row>
    </el-card>

    <!-- 结果列表 -->
    <el-card>
      <el-table :data="errorUserList" stripe style="width: 100%">
        <el-table-column prop="id" label="ID"></el-table-column>
        <el-table-column prop="pdu" label="PDU"></el-table-column>
        <el-table-column prop="keyword" label="关键词" width="180"></el-table-column>
        <el-table-column prop="descript" label="描述" width="180"></el-table-column>
        <el-table-column prop="solution" label="解决方案" width="180"></el-table-column>
        <el-table-column prop="wiki" label="维基" width="180"></el-table-column>
        <el-table-column prop="type" label="类型"></el-table-column>
        <el-table-column prop="author" label="作者"></el-table-column>
        <el-table-column prop="status" label="状态">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.status === '正常'">正常</el-tag>
            <el-tag v-else-if="scope.row.status === '禁用'" type="danger">禁用</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180">
          <template slot-scope="scope">
            <el-button @click="openEditUI(scope.row.id)" type="primary" icon="el-icon-edit" size="mini" circle></el-button>
            <el-button @click="deleteErrorUser(scope.row)" type="danger" icon="el-icon-delete" size="mini" circle></el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 分页组件 -->
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="searchModel.pageNo"
      :page-sizes="[5, 10, 20, 50]"
      :page-size="searchModel.pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
    ></el-pagination>

    <!-- 错误用户信息编辑对话框 -->
    <el-dialog @close="clearForm" :title="title" :visible.sync="dialogFormVisible">
      <el-form :model="errorUserForm" ref="errorUserFormRef" :rules="rules" label-width="100px">
        <el-form-item label="ID" prop="id">
          <el-input v-model="errorUserForm.id" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="PDU" prop="pdu">
          <el-input v-model="errorUserForm.pdu" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="关键词" prop="keyword">
          <el-input v-model="errorUserForm.keyword" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="描述" prop="descript">
          <el-input v-model="errorUserForm.descript" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="解决方案" prop="solution">
          <el-input v-model="errorUserForm.solution" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="维基" prop="wiki">
          <el-input v-model="errorUserForm.wiki" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="类型" prop="type">
          <el-select v-model="errorUserForm.type" placeholder="请选择" clearable>
            <el-option label="类型1" value="1"></el-option>
            <el-option label="类型2" value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="作者" prop="author">
          <el-input v-model="errorUserForm.author" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="errorUserForm.status">
            <el-radio label="正常"></el-radio>
            <el-radio label="禁用"></el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button type="primary" @click="saveErrorUser">保存</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import userApi from '@/api/userApi';

export default {
  data() {
    return {
      searchModel: {
        id: '',
        pageNo: 1,
        pageSize: 10,
      },
      total: 0,
      errorUserList: [],
      dialogFormVisible: false,
      errorUserForm: {
        id: '',
        pdu: '',
        keyword: '',
        descript: '',
        solution: '',
        wiki: '',
        type: '',
        author: '',
        status: '',
      },
      rules: {
        id: [{ required: true, message: '请输入ID', trigger: 'blur' }],
        pdu: [{ required: true, message: '请输入PDU', trigger: 'blur' }],
        keyword: [{ required: true, message: '请输入关键词', trigger: 'blur' }],
        descript: [{ required: true, message: '请输入描述', trigger: 'blur' }],
        solution: [{ required: true, message: '请输入解决方案', trigger: 'blur' }],
        wiki: [{ required: true, message: '请输入维基', trigger: 'blur' }],
        type: [{ required: true, message: '请选择类型', trigger: 'change' }],
        author: [{ required: true, message: '请输入作者', trigger: 'blur' }],
        status: [{ required: true, message: '请选择状态', trigger: 'change' }],
      },
      formLabelWidth: '100px',
      title: '',
    };
  },
  mounted() {
    this.getErrorUserList();
  },
  methods: {
    getErrorUserList() {
      userApi.getErrorUserList(this.searchModel).then(response => {
        this.errorUserList = response.data.rows;
        this.total = response.data.total;
      });
    },
    openEditUI(id) {
      if (id) {
        userApi.getErrorUserById(id).then(response => {
          this.errorUserForm = response.data;
          this.title = '编辑错误用户信息';
          this.dialogFormVisible = true;
        });
      } else {
        this.clearForm();
        this.title = '新增错误用户信息';
        this.dialogFormVisible = true;
      }
    },
    saveErrorUser() {
      this.$refs.errorUserFormRef.validate(valid => {
        if (valid) {
          // 保存错误用户信息的逻辑
          this.dialogFormVisible = false;
        } else {
          return false;
        }
      });
    },
    deleteErrorUser(user) {
      // 删除错误用户的逻辑
    },
    handleSizeChange(size) {
      this.searchModel.pageSize = size;
      this.getErrorUserList();
    },
    handleCurrentChange(page) {
      this.searchModel.pageNo = page;
      this.getErrorUserList();
    },
    clearForm() {
      this.$refs.errorUserFormRef.resetFields();
      this.errorUserForm = {
        id: '',
        pdu: '',
        keyword: '',
        descript: '',
        solution: '',
        wiki: '',
        type: '',
        author: '',
        status: '',
      };
    },
  },
};
</script>