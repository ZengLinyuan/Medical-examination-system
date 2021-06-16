import request from '@/utils/request'

// 查询胸部放射检查列表
export function listChest(query) {
  return request({
    url: '/department/chest/list',
    method: 'get',
    params: query
  })
}

// 查询胸部放射检查详细
export function getChest(studentId) {
  return request({
    url: '/department/chest/' + studentId,
    method: 'get'
  })
}

// 新增胸部放射检查
export function addChest(data) {
  return request({
    url: '/department/chest',
    method: 'post',
    data: data
  })
}

// 修改胸部放射检查
export function updateChest(data) {
  return request({
    url: '/department/chest',
    method: 'put',
    data: data
  })
}

// 删除胸部放射检查
export function delChest(studentId) {
  return request({
    url: '/department/chest/' + studentId,
    method: 'delete'
  })
}

// 导出胸部放射检查
export function exportChest(query) {
  return request({
    url: '/department/chest/export',
    method: 'get',
    params: query
  })
}
