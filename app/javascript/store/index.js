import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'
import {
  CHANGE_KEYWORD,
  SEARCH
} from './mutation-types'

Vue.use(Vuex)

const state = {
  keyword: '',
  items: []
}

const getters = {
  items: state => state.items
}

const mutations = {
  [CHANGE_KEYWORD] (state, keyword) {
    state.keyword = keyword
  },
  [SEARCH] (state, items) {
    state.items = items.data
  }
}

function searchItem(keyword) {
  return axios.get('/v1/rakuten_searches/search', {
    params: {
      keyword: '結婚'+ keyword,
    }
  })
}

const actions = {
  [CHANGE_KEYWORD] ({ commit }, keyword) {
    commit(CHANGE_KEYWORD, keyword)
  },

  [SEARCH] ({ commit, state }) {
    searchItem(state.keyword)
      .then(data => {
        commit(SEARCH, data)
    })
  }
}

export default new Vuex.Store({
  namespaced: true,
  state,
  getters,
  mutations,
  actions
})
