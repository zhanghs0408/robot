<template>
  <div>
    <!-- 搜索栏 -->
    <el-card id="search">
      <el-row>
        <el-col :span="20">
          <el-input
            v-model="searchModel.pdu"
            placeholder="PDU"
            clearable
          ></el-input>
          <el-button
            @click=""
            type="primary"
            round
            icon="el-icon-search"
            >查询</el-button
          >
        </el-col>
      </el-row>
    </el-card>

    <!-- 结果列表 -->
    <el-card>
      <el-table :data="errorUserList" stripe style="width: 100%">
        <el-table-column label="#" width="80">
          <template slot-scope="scope">
            {{ (searchModel.pageNo - 1) * searchModel.pageSize + scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column prop="id" label="ID" width="180"></el-table-column>
        <el-table-column prop="pdu" label="PDU" width="180"></el-table-column>
        <el-table-column prop="keyword" label="关键词" width="180"></el-table-column>
        <el-table-column prop="descript" label="描述" width="180"></el-table-column>
        <el-table-column prop="solution" label="解决方案" width="180"></el-table-column>
        <el-table-column prop="wiki" label="维基" width="180"></el-table-column>
        <el-table-column prop="type" label="类型" width="180"></el-table-column>
        <el-table-column prop="author" label="作者" width="180"></el-table-column>
        <el-table-column prop="status" label="状态" width="180">
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
      <el-form :model="errorUserForm" ref="errorUserFormRef" :rules="rules">
        <el-form-item label="PDU" prop="pdu" :label-width="formLabelWidth">
          <el-input v-model="errorUserForm.pdu" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="关键词" prop="keyword" :label-width="formLabelWidth">
          <el-input v-model="errorUserForm.keyword" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="描述" prop="descript" :label-width="formLabelWidth">
          <el-input v-model="errorUserForm.descript" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="解决方案" prop="solution" :label-width="formLabelWidth">
          <el-input v-model="errorUserForm.solution" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="维基" prop="wiki" :label-width="formLabelWidth">
          <el-input v-model="errorUserForm.wiki" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="类型" prop="type" :label-width="formLabelWidth">
          <el-select v-model="errorUserForm.type">
            <el-option label="类型1" value="类型1"></el-option>
            <el-option label="类型2" value="类型2"></el-option>
            <el-option label="类型3" value="类型3"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="作者" prop="author" :label-width="formLabelWidth">
          <el-input v-model="errorUserForm.author" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="状态" prop="status" :label-width="formLabelWidth">
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
import userApi from "@/api/errorUser.js";

export default {
  data() {
    return {
      searchModel: {
        pageNo: 1,
        pageSize: 10,
        keyword: ''
      },
      errorUserList: [],
      total: 0,
      dialogFormVisible: false,
      title: '',
      errorUserForm: {
        id: '',
        pdu: '',
        keyword: '',
        descript: '',
        solution: '',
        wiki: '',
        type: '',
        author: '',
        status: ''
      },
      formLabelWidth: '80px',
      rules: {
        pdu: [
          { required: true, message: '请输入PDU', trigger: 'blur' }
        ],
        keyword: [
          { required: true, message: '请输入关键词', trigger: 'blur' }
        ],
        descript: [
          { required: true, message: '请输入描述', trigger: 'blur' }
        ],
        solution: [
          { required: true, message: '请输入解决方案', trigger: 'blur' }
        ],
        wiki: [
          { required: true, message: '请输入维基', trigger: 'blur' }
        ],
        type: [
          { required: true, message: '请选择类型', trigger: 'change' }
        ],
        author: [
          { required: true, message: '请输入作者', trigger: 'blur' }
        ],
        status: [
          { required: true, message: '请选择状态', trigger: 'change' }
        ]
      }
    };
  },
  created() {
    this.getErrorUserList();
  },
  methods: {
    getErrorUserList() {
      errorUser.getErrorUserList(this.searchModel).then(response => {
        this.errorUserList = response.data.list;
        this.total = response.data.total;
      });
    },
    handleSizeChange(val) {
      this.searchModel.pageSize = val;
      this.getErrorUserList();
    },
    handleCurrentChange(val) {
      this.searchModel.pageNo = val;
      this.getErrorUserList();
    },
    openEditUI(id) {
      if (id) {
        // 编辑
        this.title = '编辑错误用户信息';
        // 根据id从API获取数据，此处需要调用相应的API接口
        errorUser.getErrorUserById(id).then(response => {
          this.errorUserForm = response.data;
          this.dialogFormVisible = true;
        });
      } else {
        // 新增
        this.title = '新增错误用户信息';
        this.clearForm();
        this.dialogFormVisible = true;
      }
    },
    deleteErrorUser(row) {
      this.$confirm('确认删除该错误用户信息吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 调用API接口删除数据
        errorUser.deleteErrorUser(row.id).then(() => {
          this.$message({
            type: 'success',
            message: '删除成功'
          });
          this.getErrorUserList();
        });
      }).catch(() => {
        // 用户取消删除操作
      });
    },
    saveErrorUser() {
      this.$refs.errorUserFormRef.validate(valid => {
        if (valid) {
          // 调用API接口保存数据
          // 调用API接口保存数据
          errorUser.saveErrorUser(this.errorUserForm).then(() => {
            this.$message({
              type: 'success',
              message: '保存成功'
            });
            this.dialogFormVisible = false;
            this.getErrorUserList();
          }).catch(error => {
            // 处理保存失败的情况
            console.error(error);
          });
        } else {
          // 表单验证不通过
          return false;
        }
      });
    },
    clearForm() {
      this.$refs.errorUserFormRef.resetFields();
    }
  }
};
</script>