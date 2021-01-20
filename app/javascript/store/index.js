import Vue from "vue";
import Vuex from "vuex";
import axios from "../plugins/axios";
import {
  changeKeyword,
  changeGenreId,
  changeMinPrice,
  changeMamPrice,
  changeSort,
  search,
} from "./mutation-types";

Vue.use(Vuex);

const state = {
  count: "",
  keyword: "",
  genreId: "",
  minPrice: "",
  maxPrice: "",
  sort: "",
  items: [],
};

const getters = {
  items: (state) => state.items,
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
  changeMamPrice(state, maxPrice) {
    state.maxPrice = maxPrice;
  },
  changeSort(state, sort) {
    state.sort = sort;
  },
  search(state, data) {
    state.items = data.Items;
  },
};

function searchItem(keyword, genreId, minPrice, maxPrice, sort) {
  return axios.get("https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706", {
    params: {
      applicationId: gon.rakuten_api_application_id,
      keyword: "結婚" + keyword,
      genreId: genreId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sort: sort || "standard",
      giftFlag: 1,
      imageFlag: 1
    },
  });
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

  changeMamPrice({ commit }, maxPrice) {
    commit("changeMamPrice", maxPrice);
  },

  changeSort({ commit }, sort) {
    commit("changeSort", sort);
  },

  search({ commit, state }) {
    searchItem(
      state.keyword,
      state.genreId,
      state.minPrice,
      state.maxPrice,
      state.sort
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
