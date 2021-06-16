import request from '@/utils/request'

// 查询其他科列表
export function listOther(query) {
  return request({
    url: '/department/other/list',
    method: 'get',
    params: query
  })
}

// 查询其他科详细
export function getOther(studentId) {
  return request({
    url: '/department/other/' + studentId,
    method: 'get'
  })
}

// 新增其他科
export function addOther(data) {
  return request({
    url: '/department/other',
    method: 'post',
    data: data
  })
}

// 修改其他科
export function updateOther(data) {
  return request({
    url: '/department/other',
    method: 'put',
    data: data
  })
}

// 删除其他科
export function delOther(studentId) {
  return request({
    url: '/department/other/' + studentId,
    method: 'delete'
  })
}

// 导出其他科
export function exportOther(query) {
  return request({
    url: '/department/other/export',
    method: 'get',
    params: query
  })
}
