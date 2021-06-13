import request from '@/utils/request'

// 查询医生列表
export function listDoctor(query) {
  return request({
    url: '/exam/doctor/list',
    method: 'get',
    params: query
  })
}

// 查询医生详细
export function getDoctor(id) {
  return request({
    url: '/exam/doctor/' + id,
    method: 'get'
  })
}

// 新增医生
export function addDoctor(data) {
  return request({
    url: '/exam/doctor',
    method: 'post',
    data: data
  })
}

// 修改医生
export function updateDoctor(data) {
  return request({
    url: '/exam/doctor',
    method: 'put',
    data: data
  })
}

// 删除医生
export function delDoctor(id) {
  return request({
    url: '/exam/doctor/' + id,
    method: 'delete'
  })
}

// 导出医生
export function exportDoctor(query) {
  return request({
    url: '/exam/doctor/export',
    method: 'get',
    params: query
  })
}