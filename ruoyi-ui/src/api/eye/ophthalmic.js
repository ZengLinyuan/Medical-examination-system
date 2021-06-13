import request from '@/utils/request'

// 查询眼科列表
export function listOphthalmic(query) {
  return request({
    url: '/eye/ophthalmic/list',
    method: 'get',
    params: query
  })
}

// 查询眼科详细
export function getOphthalmic(studentId) {
  return request({
    url: '/eye/ophthalmic/' + studentId,
    method: 'get'
  })
}

// 新增眼科
export function addOphthalmic(data) {
  return request({
    url: '/eye/ophthalmic',
    method: 'post',
    data: data
  })
}

// 修改眼科
export function updateOphthalmic(data) {
  return request({
    url: '/eye/ophthalmic',
    method: 'put',
    data: data
  })
}

// 删除眼科
export function delOphthalmic(studentId) {
  return request({
    url: '/eye/ophthalmic/' + studentId,
    method: 'delete'
  })
}

// 导出眼科
export function exportOphthalmic(query) {
  return request({
    url: '/eye/ophthalmic/export',
    method: 'get',
    params: query
  })
}