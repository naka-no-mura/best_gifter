import Vue from "vue";
import Vuex from "vuex";
import questionnarie from "./modules/questionnarie";
import rakuten_api from "./modules/rakuten_api";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    questionnarie,
    rakuten_api,
  },
});
