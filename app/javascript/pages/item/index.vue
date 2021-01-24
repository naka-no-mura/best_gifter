<template>
  <main class="columns">
    <div class="column is-3">
    <RakutenApiSideMenu></RakutenApiSideMenu>
    </div>
    <div class="column">
    <RakutenApiCall></RakutenApiCall>
    <RakutenApiResultHit></RakutenApiResultHit>
    <RakutenApiPagenation></RakutenApiPagenation>
    <RakutenApiResultList></RakutenApiResultList>
    <RakutenApiPagenation></RakutenApiPagenation>
    </div>
  </main>
</template>

<script>
import RakutenApiSideMenu from "./components/RakutenApiSideMenu.vue";
import RakutenApiCall from "./components/RakutenApiCall.vue";
import RakutenApiResultList from "./components/RakutenApiResultList.vue";
import RakutenApiResultHit from "./components/RakutenApiResultHit.vue";
import RakutenApiPagenation from "./components/RakutenApiPagenation.vue";

export default {
  name: "ItemIndex",
  components: {
    RakutenApiSideMenu,
    RakutenApiCall,
    RakutenApiResultList,
    RakutenApiResultHit,
    RakutenApiPagenation,
  },
};
</script>

<style scoped></style>
