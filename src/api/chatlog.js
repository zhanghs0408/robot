import request from '@/utils/request'

export function getChatLog(page, size) {
  return request({
    url: '/api/chat-logs',
    method: 'get',
    params: {
      page: page,
      size: size
    }
  })
}
