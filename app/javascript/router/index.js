import Vue from 'vue';
import Router from 'vue-router';

import TopIndex from '../pages/top/index';
import ItemIndex from '../pages/item/index';
import ItemsIndex from '../pages/items/index';

Vue.use(Router);

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: TopIndex,
      name: 'TopIndex',
    },
    {
      path: '/items',
      component: ItemIndex,
      name: 'ItemIndex',
    },
    {
      path: '/itemss',
      component: ItemsIndex,
      name: 'ItemsIndex',
    },
  ],
})

export default router
