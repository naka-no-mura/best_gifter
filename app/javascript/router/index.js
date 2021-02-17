import Vue from 'vue';
import Router from 'vue-router';
import store from '../store'

import TopIndex from '../pages/top/index';
import ItemIndex from '../pages/item/index';
import QuestionnaireIndex from "../pages/questionnaire/index";
import RegisterIndex from "../pages/register/index";
import LoginIndex from "../pages/login/index";
import MypageIndex from "../pages/mypage/index";

Vue.use(Router);

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: TopIndex,
      name: "TopIndex",
    },
    {
      path: "/items",
      component: ItemIndex,
      name: "ItemIndex",
    },
    {
      path: "/questionnaires",
      component: QuestionnaireIndex,
      name: "QuestionnaireIndex",
    },
    {
      path: "/register",
      component: RegisterIndex,
      name: "RegisterIndex",
    },
    {
      path: "/login",
      component: LoginIndex,
      name: "LoginIndex",
    },
    {
      path: "/mypage",
      component: MypageIndex,
      name: "MypageIndex",
    },
  ],
});

router.beforeEach((to, from, next) => {
  store.dispatch('users/fetchAuthUser').then((authUser) => {
    if (to.matched.some(record => record.meta.requiredAuth) && !authUser) {
      next({ name: 'LoginIndex' });
    } else {
      next();
    }
  })
});

export default router
