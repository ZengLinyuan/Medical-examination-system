import { getToken, setToken, removeToken } from '@/utils/auth'
import {getStudent} from "@/api/exam/input";

const exam = {
  state: {
    token: getToken(),
    studentId: '',
  },

  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_NAME: (state, studentId) => {
      state.studentId = studentId
    }
    },

  actions: {
    // 登录
    studentInput({ commit }, studentInfo) {
      const studentId = studentInfo.studentId.trim()
      return new Promise((resolve, reject) => {
        getStudent(studentId).then(res => {
          setToken(res.token)
          commit('SET_TOKEN', res.token)
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    }
  }
}

export default exam
