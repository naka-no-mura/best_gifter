<template>
  <main class="columns">
    <div class="column is-3">
    <RakutenApiSideMenu v-show="!loading"></RakutenApiSideMenu>
    </div>
    <div class="column">
    <RakutenApiCall v-show="!loading"></RakutenApiCall>
    <RakutenApiResultHit v-show="!loading"></RakutenApiResultHit>
    <Loading v-show="loading"></Loading>
    <RakutenApiPagenation v-show="!loading"></RakutenApiPagenation>
    <RakutenApiResultList v-show="!loading"></RakutenApiResultList>
    <RakutenApiPagenation v-show="!loading"></RakutenApiPagenation>
    </div>
  </main>
</template>

<script>
import RakutenApiSideMenu from "./components/RakutenApiSideMenu.vue";
import RakutenApiCall from "./components/RakutenApiCall.vue";
import RakutenApiResultList from "./components/RakutenApiResultList.vue";
import RakutenApiResultHit from "./components/RakutenApiResultHit.vue";
import RakutenApiPagenation from "./components/RakutenApiPagenation.vue";
import Loading from "./components/Loading.vue";

export default {
  name: "ItemIndex",
  components: {
    RakutenApiSideMenu,
    RakutenApiCall,
    RakutenApiResultList,
    RakutenApiResultHit,
    RakutenApiPagenation,
    Loading
  },
  data() {
    return {
      loading: true,
    }
  },
  mounted() {
    setTimeout(() => {
      this.loading = false;
    }, 1000);
  },
};
</script>

<style scoped></style>
