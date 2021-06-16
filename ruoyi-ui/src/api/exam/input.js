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
    url: '/health/form',
    method: 'put',
    data: data
  })
}