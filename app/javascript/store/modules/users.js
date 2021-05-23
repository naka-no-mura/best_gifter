import axios from "../../plugins/axios";

const state = {
  authUser: null,
};

const getters = {
  authUser: (state) => state.authUser,
};

const mutations = {
  setUser: (state, user) => {
    state.authUser = user;
  },
};

const actions = {
  async loginUser({ commit }, user) {
    // ログイン
    const sessionsResponse = await axios.post("/v1/sessions", user);
    localStorage.auth_token = sessionsResponse.data.token;
    axios.defaults.headers.common[
      "Authorization"
    ] = `Bearer ${localStorage.auth_token}`;
    // ログインユーザー情報の取得
    const userResponse = await axios.get("/v1/users/me");
    commit("setUser", userResponse.data);
  },
  logoutUser({ commit }) {
    // ログアウト
    localStorage.removeItem("auth_token");
    axios.defaults.headers.common["Authorization"] = "";
    commit("setUser", null);
  },
  async fetchAuthUser({ commit, state }) {
    if (!localStorage.auth_token) return null;
    if (state.authUser) return state.authUser;

    const userResponse = await axios.get("/v1/users/me").catch((err) => {
      return null;
    });
    if (!userResponse) return null;

    const authUser = userResponse.data;
    if (authUser) {
      commit("setUser", authUser);
      return authUser;
    } else {
      commit("setUser", null);
      return null;
    }
  },
  // SNSシェアリンクからきた人用
  async loginUserForVote({ commit }, user) {
    // ログイン
    // const sessionsResponse = await axios.post("http://localhost:3000/api/v1/sessions", user);
    const sessionsResponse = await axios.post("https://www.best-gifter.work/api/v1/sessions", user);
    localStorage.auth_token = sessionsResponse.data.token;
    axios.defaults.headers.common[
      "Authorization"
    ] = `Bearer ${localStorage.auth_token}`;
    // ログインユーザー情報の取得
    // const userResponse = await axios.get("http://localhost:3000/api/v1/users/me");
    const userResponse = await axios.get("https://www.best-gifter.work/api/v1/users/me");
    commit("setUser", userResponse.data);
  },
};

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
};
