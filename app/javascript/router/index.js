import Vue from 'vue';
import Router from 'vue-router';
import store from '../store'

import TopIndex from '../pages/top/index.vue';
import ItemIndex from '../pages/item/index.vue';
import QuestionnaireFormIndex from "../pages/questionnaireForm/index.vue";
import QuestionnaireListIndex from "../pages/questionnaireList/index.vue";
import QuestionnaireShowIndex from "../pages/questionnaireList/components/QuestionnaireShow.vue";
import RegisterIndex from "../pages/register/index.vue";
import LoginIndex from "../pages/login/index.vue";
import MypageIndex from "../pages/mypage/index.vue";
import TheTermsIndex from "../pages/common/TheTerms.vue";
import ThePrivacyPolicyIndex from "../pages/common/ThePrivacyPolicy.vue";
import NotFoundIndex from "../pages/common/errors/NotFound.vue";

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
      path: "/questionnaire_form",
      component: QuestionnaireFormIndex,
      name: "QuestionnaireFormIndex",
      meta: { requiredAuth: true },
    },
    {
      path: "/questionnaire_list",
      component: QuestionnaireListIndex,
      name: "QuestionnaireListIndex",
      meta: { requiredAuth: true },
    },
    {
      path: "/questionnaire_list/:id",
      component: QuestionnaireShowIndex,
      props: routes => ({
            id: Number(routes.params.id),
      }),
      name: "QuestionnaireShowIndex",
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
      meta: { requiredAuth: true },
    },
    {
      path: "/terms",
      component:  TheTermsIndex,
      name: "TermsIndex",
    },
    {
      path: "/privacy_policys",
      component:  ThePrivacyPolicyIndex,
      name: "PrivacyPolicyIndex",
    },
    {
      path: '*',
      component: NotFoundIndex,
      name: "NotFoundIndex"
    },
  ],
  scrollBehavior (to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { x: 0, y: 0 }
    }
  }
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
