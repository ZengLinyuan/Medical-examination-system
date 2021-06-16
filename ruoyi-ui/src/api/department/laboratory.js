import request from '@/utils/request'

// 查询化验科列表
export function listLaboratory(query) {
  return request({
    url: '/department/laboratory/list',
    method: 'get',
    params: query
  })
}

// 查询化验科详细
export function getLaboratory(studentId) {
  return request({
    url: '/department/laboratory/' + studentId,
    method: 'get'
  })
}

// 新增化验科
export function addLaboratory(data) {
  return request({
    url: '/department/laboratory',
    method: 'post',
    data: data
  })
}

// 修改化验科
export function updateLaboratory(data) {
  return request({
    url: '/department/laboratory',
    method: 'put',
    data: data
  })
}

// 删除化验科
export function delLaboratory(studentId) {
  return request({
    url: '/department/laboratory/' + studentId,
    method: 'delete'
  })
}

// 导出化验科
export function exportLaboratory(query) {
  return request({
    url: '/department/laboratory/export',
    method: 'get',
    params: query
  })
}
