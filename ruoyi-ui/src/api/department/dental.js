import request from '@/utils/request'

// 查询牙科列表
export function listDental(query) {
  return request({
    url: '/department/dental/list',
    method: 'get',
    params: query
  })
}

// 查询牙科详细
export function getDental(studentId) {
  return request({
    url: '/department/dental/' + studentId,
    method: 'get'
  })
}

// 新增牙科
export function addDental(data) {
  return request({
    url: '/department/dental',
    method: 'post',
    data: data
  })
}

// 修改牙科
export function updateDental(data) {
  return request({
    url: '/department/dental',
    method: 'put',
    data: data
  })
}

// 删除牙科
export function delDental(studentId) {
  return request({
    url: '/department/dental/' + studentId,
    method: 'delete'
  })
}

// 导出牙科
export function exportDental(query) {
  return request({
    url: '/department/dental/export',
    method: 'get',
    params: query
  })
}