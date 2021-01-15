import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'
import {
  CHANGE_KEYWORD,
  CHANGE_GENRE_ID,
  CHANGE_MIN_PRICE,
  CHANGE_MAX_PRICE,
  SEARCH,
} from './mutation-types'

Vue.use(Vuex)

const state = {
  keyword: '',
  genreId: '',
  minPrice:'',
  maxPrice: '',
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
  [CHANGE_MIN_PRICE] (state, minPrice) {
    state.minPrice = minPrice
  },
  [CHANGE_MAX_PRICE] (state, maxPrice) {
    state.maxPrice = maxPrice
  },
  [SEARCH] (state, items) {
    state.items = items.data
  }
}

function searchItem(keyword, genreId, minPrice, maxPrice) {
  return axios.get('/v1/rakuten_searches/search', {
    params: {
      keyword: '結婚' + keyword,
      genreId: genreId,
      minPrice: minPrice,
      maxPrice: maxPrice,
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

  [CHANGE_MIN_PRICE] ({ commit }, minPrice) {
    commit(CHANGE_MIN_PRICE, minPrice)
  },

  [CHANGE_MAX_PRICE] ({ commit }, maxPrice) {
    commit(CHANGE_MAX_PRICE, maxPrice)
  },

  [SEARCH] ({ commit, state }) {
    searchItem(state.keyword, state.genreId, state.minPrice, state.maxPrice)
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
