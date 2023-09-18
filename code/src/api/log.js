import request from '@/utils/request'

export function chatlog() {
  return request({
    url: '/api/chat-logs',
    method: 'get'
  })
}
