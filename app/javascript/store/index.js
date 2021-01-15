import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'
import {
  CHANGE_KEYWORD,
  SEARCH,
  CHANGE_GENRE_ID,
} from './mutation-types'

Vue.use(Vuex)

const state = {
  keyword: '',
  genreId: '',
  items: []
}

const getters = {
  items: state => state.items
}

const mutations = {
  [CHANGE_KEYWORD] (state, keyword) {
    state.keyword = keyword
  },
  [CHANGE_GENRE_ID] (state, genreId) {
    state.genreId = genreId
  },
  [SEARCH] (state, items) {
    state.items = items.data
  }
}

function searchItem(keyword, genreId) {
  return axios.get('/v1/rakuten_searches/search', {
    params: {
      keyword: '結婚' + keyword,
      genreId: genreId,
    }
  })
}

const actions = {
  [CHANGE_KEYWORD] ({ commit }, keyword) {
    commit(CHANGE_KEYWORD, keyword)
  },

  [CHANGE_GENRE_ID] ({ commit }, genreId) {
    commit(CHANGE_GENRE_ID, genreId)
  },

  [SEARCH] ({ commit, state }) {
    searchItem(state.keyword, state.genreId)
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
