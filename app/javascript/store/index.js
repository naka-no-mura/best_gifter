import Vue from "vue";
import Vuex from "vuex";
import rakuten_api from "./modules/rakuten_api";
import users from "./modules/users";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    rakuten_api,
    users,
  },
});
