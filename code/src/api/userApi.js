import request from '@/utils/request';

export default {
  getErrorUserList(searchModel) {
    return request({
      url: '/errorUser/list',
      method: 'get',
      params: {
        pageNo: searchModel.pageNo,
        pageSize: searchModel.pageSize,
        roleName: searchModel.roleName,
      },
    });
  },
  addErrorUser(errorUser) {
    return request({
      url: '/errorUser',
      method: 'post',
      data: errorUser,
    });
  },
  updateErrorUser(errorUser) {
    return request({
      url: '/errorUser',
      method: 'put',
      data: errorUser,
    });
  },
  saveErrorUser(errorUser) {
    if (errorUser.id == null || errorUser.id === undefined) {
      return this.addErrorUser(errorUser);
    }
    return this.updateErrorUser(errorUser);
  },
  getErrorUserById(id) {
    return request({
      url: `/errorUser/${id}`,
      method: 'get',
    });
  },
  deleteErrorUserById(id) {
    return request({
      url: `/errorUser/${id}`,
      method: 'delete',
    });
  },
  getAllErrorUserList() {
    return request({
      url: '/errorUser/all',
      method: 'get',
    });
  },
};