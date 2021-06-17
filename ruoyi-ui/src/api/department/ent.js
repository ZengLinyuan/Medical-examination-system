import request from '@/utils/request'

// 查询耳鼻喉科列表
export function listEnt(query) {
  return request({
    url: '/department/ent/list',
    method: 'get',
    params: query
  })
}

// 查询耳鼻喉科详细
export function getEnt(studentId) {
  return request({
    url: '/department/ent/' + studentId,
    method: 'get'
  })
}

// 新增耳鼻喉科
export function addEnt(data) {
  return request({
    url: '/department/ent',
    method: 'post',
    data: data
  })
}

// 修改耳鼻喉科
export function updateEnt(data) {
  return request({
    url: '/department/ent',
    method: 'put',
    data: data
  })
}

// 删除耳鼻喉科
export function delEnt(studentId) {
  return request({
    url: '/department/ent/' + studentId,
    method: 'delete'
  })
}

// 导出耳鼻喉科
export function exportEnt(query) {
  return request({
    url: '/department/ent/export',
    method: 'get',
    params: query
  })
}