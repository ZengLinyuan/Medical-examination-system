import request from '@/utils/request'

// 检查体检学生信息
export function getStudent(id) {
  return request({
    url: '/student/student/' + id,
    method: 'get',
  })
}

export function commitEyeForm(data) {
  return request({
    url: '/department/ophthalmic/add',
    method: 'post',
    data: data
  })
}

export function commitChestForm(data) {
  return request({
    url: '/department/chest/add',
    method: 'post',
    data: data
  })
}

export function commitInternalForm(data) {
  return request({
    url: '/department/internal/add',
    method: 'post',
    data: data
  })
}

export function commitLaboratoryForm(data) {
  return request({
    url: '/department/laboratory/add',
    method: 'post',
    data: data
  })
}

export function commitOtherForm(data) {
  return request({
    url: '/department/other/add',
    method: 'post',
    data: data
  })
}
