import request from '@/utils/request'

export function exportTotal(query) {
  return request({
    url: '/total/export',
    method: 'get',
    params: query
  })
}
