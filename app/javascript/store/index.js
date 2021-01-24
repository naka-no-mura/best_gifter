import Vue from "vue";
import Vuex from "vuex";
import axios from "../plugins/axios";
import {
  changeKeyword,
  changeGenreId,
  changeMinPrice,
  changeMaxPrice,
  changeSort,
  changePage,
  search,
} from "./mutation-types";

Vue.use(Vuex);

const state = {
  keyword: "",
  genreId: "",
  minPrice: "",
  maxPrice: "",
  sort: "",
  items: [],
  count: "",
  first: "",
  last: "",
  currentPage: "",
  pageCount: "",
};

const getters = {
  keyword: (state) => state.keyword,
  items: (state) => state.items,
  count: (state) => state.count,
  first: (state) => state.first,
  last: (state) => state.last,
  currentPage: (state) => state.currentPage,
  pageCount: (state) => state.pageCount,
};

const mutations = {
  changeKeyword(state, keyword) {
    state.keyword = keyword;
  },
  changeGenreId(state, genreId) {
    state.genreId = genreId;
  },
  changeMinPrice(state, minPrice) {
    state.minPrice = minPrice;
  },
  changeMaxPrice(state, maxPrice) {
    state.maxPrice = maxPrice;
  },
  changeSort(state, sort) {
    state.sort = sort;
  },
  changePage(state, page) {
    state.page = page;
  },
  search(state, data) {
    state.items = data.Items;
    state.count = data.count;
    state.first = data.first;
    state.last = data.last;
    state.currentPage = data.page;
    state.pageCount = data.pageCount;
  },
};

function searchItem(keyword, genreId, minPrice, maxPrice, sort, changePage) {
  return axios.get(
    "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706",
    {
      params: {
        applicationId: gon.rakuten_api_application_id,
        keyword: "結婚" + keyword,
        genreId: genreId,
        minPrice: minPrice || 1000,
        maxPrice: maxPrice || 150000,
        sort: sort || "standard",
        giftFlag: 1,
        imageFlag: 1,
        page: changePage || 1,
      },
    }
  );
}

const actions = {
  changeKeyword({ commit }, keyword) {
    commit("changeKeyword", keyword);
  },

  changeGenreId({ commit }, genreId) {
    commit("changeGenreId", genreId);
  },

  changeMinPrice({ commit }, minPrice) {
    commit("changeMinPrice", minPrice);
  },

  changeMaxPrice({ commit }, maxPrice) {
    commit("changeMaxPrice", maxPrice);
  },

  changeSort({ commit }, sort) {
    commit("changeSort", sort);
  },

  changePage({ commit }, page) {
    commit("changePage", page);
  },

  search({ commit, state }) {
    searchItem(
      state.keyword,
      state.genreId,
      state.minPrice,
      state.maxPrice,
      state.sort,
      state.page
    ).then((res) => {
      commit("search", res.data);
    });
  },
};

export default new Vuex.Store({
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
});
