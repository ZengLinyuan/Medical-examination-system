import request from '@/utils/request'

// 查询外科列表
export function listSurgery(query) {
  return request({
    url: '/department/surgery/list',
    method: 'get',
    params: query
  })
}

// 查询外科详细
export function getSurgery(studentId) {
  return request({
    url: '/department/surgery/' + studentId,
    method: 'get'
  })
}

// 新增外科
export function addSurgery(data) {
  return request({
    url: '/department/surgery',
    method: 'post',
    data: data
  })
}

// 修改外科
export function updateSurgery(data) {
  return request({
    url: '/department/surgery',
    method: 'put',
    data: data
  })
}

// 删除外科
export function delSurgery(studentId) {
  return request({
    url: '/department/surgery/' + studentId,
    method: 'delete'
  })
}

// 导出外科
export function exportSurgery(query) {
  return request({
    url: '/department/surgery/export',
    method: 'get',
    params: query
  })
}