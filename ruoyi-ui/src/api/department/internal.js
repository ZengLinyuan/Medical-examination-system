import request from '@/utils/request'

// 查询内科列表
export function listInternal(query) {
  return request({
    url: '/department/internal/list',
    method: 'get',
    params: query
  })
}

// 查询内科详细
export function getInternal(studentId) {
  return request({
    url: '/department/internal/' + studentId,
    method: 'get'
  })
}

// 新增内科
export function addInternal(data) {
  return request({
    url: '/department/internal',
    method: 'post',
    data: data
  })
}

// 修改内科
export function updateInternal(data) {
  return request({
    url: '/department/internal',
    method: 'put',
    data: data
  })
}

// 删除内科
export function delInternal(studentId) {
  return request({
    url: '/department/internal/' + studentId,
    method: 'delete'
  })
}

// 导出内科
export function exportInternal(query) {
  return request({
    url: '/department/internal/export',
    method: 'get',
    params: query
  })
}
