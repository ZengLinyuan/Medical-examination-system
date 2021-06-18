import request from '@/utils/request'

// 查询体检总列表
export function listForm(query) {
  return request({
    url: '/health/form/list',
    method: 'get',
    params: query
  })
}

// 查询体检总详细
export function getForm(studentId) {
  return request({
    url: '/health/form/' + studentId,
    method: 'get'
  })
}

// 新增体检总
export function addForm(data) {
  return request({
    url: '/health/form',
    method: 'post',
    data: data
  })
}

// 修改体检总
export function updateForm(data) {
  return request({
    url: '/health/form',
    method: 'put',
    data: data
  })
}

// 删除体检总
export function delForm(studentId) {
  return request({
    url: '/health/form/' + studentId,
    method: 'delete'
  })
}

// 导出体检总
export function exportForm(query) {
  return request({
    url: '/health/form/export',
    method: 'get',
    params: query
  })
}

//获得体检信息
export function getStuForm(query){
    return request({
      url: '/health/form/stuList',
      method: 'get',
      params:query
    })
}

/*export function getDetailData(studentId,diagnosisTime) {
  return request({
    url: "/health/form/details?studentId=" + studentId + '&' + 'diagnosisTime=' + diagnosisTime,
    method: 'get'
  })
}*/

export function getDetailData(query) {
  return request({
    url: '/health/form/details',
    method: 'get',
    params: query
  })
}



