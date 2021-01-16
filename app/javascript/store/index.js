import Vue from 'vue'
import Vuex from 'vuex'
import axios from '../plugins/axios'
import {
  // CHANGE_KEYWORD,
  changeKeyword,
  // CHANGE_GENRE_ID,
  changeGenreId,
  // CHANGE_MIN_PRICE,
  changeMinPrice,
  // CHANGE_MAX_PRICE,
  changeMamPrice,
  // CHANGE_SORT,
  changeSort,
  // SEARCH,
  search,
} from './mutation-types'

Vue.use(Vuex)

const state = {
  keyword: '',
  genreId: '',
  minPrice:'',
  maxPrice: '',
  sort: '',
  items: [],
  // genreIds: [
  //   { genreId: 100433, name: 'ルームウェア' },
  //   { genreId: 562637, name: '家電' },
  //   { genreId: 510915, name: '洋酒' },
  //   { genreId: 100804, name: 'インテリア' },
  //   { genreId: 215783, name: '日用品雑貨' },
  //   { genreId: 558944, name: 'キッチン用品・食器' },
  //   { genreId: 100005, name: '花' },
  //   { genreId: 566732, name: 'カタログ' },
  //   { genreId: 553283, name: 'ギフト券・商品券' },
  // ],
}

const getters = {
  items: state => state.items,
  // genreIds: state => state.genreIds,
}

const mutations = {
  // [CHANGE_KEYWORD] (state, keyword) {
  //   state.keyword = keyword
  // },
  changeKeyword(state, keyword) {
    state.keyword = keyword
  },
  // [CHANGE_GENRE_ID] (state, genreId) {
  //   state.genreId = genreId
  // },
  changeGenreId(state, genreId) {
    state.genreId = genreId
  },
  changeMinPrice(state, minPrice) {
    state.minPrice = minPrice
  },
  changeMamPrice(state, maxPrice) {
    state.maxPrice = maxPrice
  },
  // [CHANGE_SORT] (state, sort) {
  //   state.sort = sort
  // },
  changeSort(state, sort) {
    state.sort = sort
  },
  // [SEARCH] (state, items) {
  //   state.items = items.data
  // },
  search(state, items) {
    state.items = items.data
  },
}

function searchItem(keyword, genreId, minPrice, maxPrice, sort) {
  return axios.get('/v1/rakuten_searches/search', {
    params: {
      keyword: '結婚' + keyword,
      genreId: genreId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sort: sort || 'standard',
    }
  })
}

const actions = {
  // [CHANGE_KEYWORD] ({ commit }, keyword) {
  //   commit(CHANGE_KEYWORD, keyword)
  // },
  changeKeyword({ commit }, keyword) {
    commit('changeKeyword', keyword)
  },

  changeGenreId({ commit }, genreId) {
    commit('changeGenreId', genreId)
  },
  // [CHANGE_GENRE_ID] ({ commit }, genreId) {
  //   commit(CHANGE_GENRE_ID, genreId)
  // },

  // [CHANGE_MIN_PRICE] ({ commit }, minPrice) {
  //   commit(CHANGE_MIN_PRICE, minPrice)
  // },
  changeMinPrice({ commit }, minPrice) {
    commit('changeMinPrice', minPrice)
  },

  // [CHANGE_MAX_PRICE] ({ commit }, maxPrice) {
  //   commit(CHANGE_MAX_PRICE, maxPrice)
  // },
  changeMamPrice({ commit }, maxPrice) {
    commit('changeMamPrice', maxPrice)
  },

  // [CHANGE_SORT] ({ commit }, sort) {
  //   commit(CHANGE_SORT, sort)
  // },
  changeSort({ commit }, sort) {
    commit('changeSort', sort)
  },

  // [SEARCH] ({ commit, state }) {
  //   searchItem(state.keyword, state.genreId, state.minPrice, state.maxPrice, state.sort)
  //     .then(data => {
  //       commit(SEARCH, data)
  //   })
  // },
  search({ commit, state }) {
    searchItem(state.keyword, state.genreId, state.minPrice, state.maxPrice, state.sort)
      .then(data => {
        commit('search', data)
    })
  },
}

export default new Vuex.Store({
  namespaced: true,
  state,
  getters,
  mutations,
  actions
})
