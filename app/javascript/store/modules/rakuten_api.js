import Vue from "vue";
import Vuex from "vuex";
import axios from "../../plugins/axios";
import {
  changeKeyword,
  changeGenreId,
  changeMinPrice,
  changeMaxPrice,
  changeSort,
  changePage,
  search,
} from "../mutation-types";

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
  reviewCount: "",
  reviewAverage: "",
  hits: "",
  shopName: "",
  itemCode: "",
  error: "",
};

const getters = {
  keyword: (state) => state.keyword,
  genreId: (state) => state.genreId,
  minPrice: (state) => state.minPrice,
  maxPrice: (state) => state.maxPrice,
  items: (state) => state.items,
  count: (state) => state.count,
  first: (state) => state.first,
  last: (state) => state.last,
  currentPage: (state) => state.currentPage,
  pageCount: (state) => state.pageCount,
  reviewCount: (state) => state.reviewCount,
  reviewAverage: (state) => state.reviewAverage,
  hits: (state) => state.hits,
  shopName: (state) => state.shopName,
  itemCode: (state) => state.itemCode,
  error: (state) => state.error,
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
    state.reviewCount = data.reviewCount;
    state.reviewAverage = data.reviewAverage;
    state.hits = data.hits;
    state.shopName = data.shopName;
    state.itemCode = data.itemCode;
    state.error = data.error_description;
  },
};

// フォームから検索する用
function searchItem(keyword, genreId, minPrice, maxPrice, sort, changePage) {
  return axios.get("/v1/rakuten_apis/search", {
    params: {
      keyword: "結婚" + " " + keyword,
      genreId: genreId,
      minPrice: minPrice || 1000,
      maxPrice: maxPrice || 150000,
      sort: sort || "standard",
      giftFlag: 1,
      imageFlag: 1,
      page: changePage || 1,
    },
  });
}

// サイドバーからジャンル検索するとき用
function genreSearchItem(genreId, minPrice, maxPrice, changePage, sort) {
  return axios.get("/v1/rakuten_apis/search", {
    params: {
      keyword: "結婚",
      genreId: genreId,
      minPrice: 1000,
      maxPrice: 150000,
      sort: sort || "standard",
      page: changePage || 1,
      giftFlag: 1,
      imageFlag: 1,
    },
  });
}

// 友人でジャンル検索するとき用
function friendGenreSearchItem(genreId, minPrice, maxPrice, changePage, sort) {
  return axios.get("/v1/rakuten_apis/search", {
    params: {
      keyword: "結婚",
      genreId: genreId,
      minPrice: 10000,
      maxPrice: 30000,
      sort: sort || "standard",
      page: changePage || 1,
      giftFlag: 1,
      imageFlag: 1,
    },
  });
}

// 親族でジャンル検索するとき用
function relativeGenreSearchItem(genreId, minPrice, maxPrice, changePage, sort) {
  return axios.get("/v1/rakuten_apis/search", {
    params: {
      keyword: "結婚",
      genreId: genreId,
      minPrice: 30000,
      maxPrice: 50000,
      sort: sort || "standard",
      page: changePage || 1,
      giftFlag: 1,
      imageFlag: 1,
    },
  });
}

// 同僚でジャンル検索するとき用
function colleagueGenreSearchItem(genreId, minPrice, maxPrice, changePage, sort) {
  return axios.get("/v1/rakuten_apis/search", {
    params: {
      keyword: "結婚",
      genreId: genreId,
      minPrice: 10000,
      maxPrice: 20000,
      sort: sort || "standard",
      page: changePage || 1,
      giftFlag: 1,
      imageFlag: 1,
    },
  });
}

// 上司でジャンル検索するとき用
function bossGenreSearchItem(genreId, minPrice, maxPrice, changePage, sort) {
  return axios.get("/v1/rakuten_apis/search", {
    params: {
      keyword: "結婚",
      genreId: genreId,
      minPrice: 1000,
      maxPrice: 5000,
      sort: sort || "standard",
      page: changePage || 1,
      giftFlag: 1,
      imageFlag: 1,
    },
  });
}

// 別ジャンルで検索する時はキーワードをnullにする
function resetKeywordState() {
  state.keyword = "";
}

// 検索条件をリセットする
function resetAllState() {
  state.keyword = "";
  state.genreId = "";
  state.minPrice = "";
  state.maxPrice = "";
  state.sort = "";
  state.page = "";
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

  // フォーム検索用
  search({ commit, state }) {
    searchItem(
      state.keyword,
      state.genreId,
      state.minPrice,
      state.maxPrice,
      state.sort,
      state.page
    )
      .then((res) => {
        commit("search", res.data);
      })
      .catch((error) => {
        // これでcatchしたerrorがどんな情報が入っているか調べる
        // for (let key of Object.keys(error)) {
        //   console.log(key);
        //   console.log(error[key]);
        // },
        console.log(error.response.data);
        commit("search", error.response.data);
      });
  },

  // サイドバーのジャンル検索用
  genreSearch({ commit, state }) {
    resetKeywordState();
    genreSearchItem(
      state.genreId,
      state.minPrice,
      state.maxPrice,
      state.page,
      state.sort
    )
      .then((res) => {
        commit("search", res.data);
      })
      .catch((error) => {
        console.log(error.response.data);
        commit("search", error.response.data);
      });
  },

  // 友人のジャンル検索用
  friendGenreSearch({ commit, state }) {
    resetKeywordState();
    friendGenreSearchItem(
      state.genreId,
      state.minPrice,
      state.maxPrice,
      state.page,
      state.sort
    )
      .then((res) => {
        commit("search", res.data);
      })
      .catch((error) => {
        console.log(error.response.data);
        commit("search", error.response.data);
      });
  },

  // 親族のジャンル検索用
  relativeGenreSearch({ commit, state }) {
    resetKeywordState();
    relativeGenreSearchItem(
      state.genreId,
      state.minPrice,
      state.maxPrice,
      state.page,
      state.sort
    )
      .then((res) => {
        commit("search", res.data);
      })
      .catch((error) => {
        console.log(error.response.data);
        commit("search", error.response.data);
      });
  },

  // 同僚のジャンル検索用
  colleagueGenreSearch({ commit, state }) {
    resetKeywordState();
    colleagueGenreSearchItem(
      state.genreId,
      state.minPrice,
      state.maxPrice,
      state.page,
      state.sort
    )
      .then((res) => {
        commit("search", res.data);
      })
      .catch((error) => {
        console.log(error.response.data);
        commit("search", error.response.data);
      });
  },

  // 上司のジャンル検索用
  bossGenreSearch({ commit, state }) {
    resetKeywordState();
    bossGenreSearchItem(
      state.genreId,
      state.minPrice,
      state.maxPrice,
      state.page,
      state.sort
    )
      .then((res) => {
        commit("search", res.data);
      })
      .catch((error) => {
        console.log(error.response.data);
        commit("search", error.response.data);
      });
  },

  // 検索条件をリセットしてジェンルで検索する用
  resetSearch({ commit, state }) {
    resetAllState();
    searchItem(
      state.keyword,
      state.genreId,
      state.minPrice,
      state.maxPrice,
      state.sort,
      state.page
    )
      .then((res) => {
        commit("search", res.data);
      })
      .catch((error) => {
        console.log(error.response.data);
        commit("search", error.response.data);
      });
  },
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
};
