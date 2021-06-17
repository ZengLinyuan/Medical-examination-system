import request from '@/utils/request'

// 查询血压脉搏科列表
export function listPulse(query) {
  return request({
    url: '/department/pulse/list',
    method: 'get',
    params: query
  })
}

// 查询血压脉搏科详细
export function getPulse(studentId) {
  return request({
    url: '/department/pulse/' + studentId,
    method: 'get'
  })
}

// 新增血压脉搏科
export function addPulse(data) {
  return request({
    url: '/department/pulse',
    method: 'post',
    data: data
  })
}

// 修改血压脉搏科
export function updatePulse(data) {
  return request({
    url: '/department/pulse',
    method: 'put',
    data: data
  })
}

// 删除血压脉搏科
export function delPulse(studentId) {
  return request({
    url: '/department/pulse/' + studentId,
    method: 'delete'
  })
}

// 导出血压脉搏科
export function exportPulse(query) {
  return request({
    url: '/department/pulse/export',
    method: 'get',
    params: query
  })
}