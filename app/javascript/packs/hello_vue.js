/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import App from '../app.vue'
import Buefy from 'buefy'
import 'buefy/dist/buefy.css'
import "@mdi/font/css/materialdesignicons.css";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
import router from '../router/index'
import axios from '../plugins/axios'
import store from '../store/index'
import VuePaginate from "vue-paginate";
import StarRating from "vue-star-rating";
import VueLoading from "vue-loading-template";
import "../plugins/veevalidate";
import Toasted from 'vue-toasted';
import VuePoll from 'vue-poll';
import "../../assets/stylesheets/style.scss";

var options = {
  position: 'top-center',
  duration: 4000,
  singleton: true,
  theme: 'outline'
}

Vue.prototype.$axios = axios
Vue.use(Buefy);
Vue.component("VSelect", vSelect);
Vue.use(VuePaginate);
Vue.component("StarRating", StarRating);
Vue.use(VueLoading);
Vue.use(Toasted, options);
Vue.use(VuePoll);
Vue.component("VuePoll", VuePoll);

Vue.filter("priceLocaleString", function(value) {
  return value.toLocaleString();
});

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    store,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
