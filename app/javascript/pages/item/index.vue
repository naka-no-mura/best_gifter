<template>
  <div>
    <div>
      <RakutenApiSideMenu></RakutenApiSideMenu>
      <RakutenApiCall></RakutenApiCall>
      <RelationshipRakutenApiCall></RelationshipRakutenApiCall>
      <RakutenApiResultHit></RakutenApiResultHit>
      <RakutenApiResultList></RakutenApiResultList>
      <RakutenApiPagenation></RakutenApiPagenation>
    </div>
  </div>
</template>

<script>
import RakutenApiSideMenu from "./components/RakutenApiSideMenu.vue";
import RakutenApiCall from "./components/RakutenApiCall.vue";
import RelationshipRakutenApiCall from "./components/RelationshipRakutenApiCall.vue";
import RakutenApiResultList from "./components/RakutenApiResultList.vue";
import RakutenApiResultHit from "./components/RakutenApiResultHit.vue";
import RakutenApiPagenation from "./components/RakutenApiPagenation.vue";

export default {
  name: "ItemIndex",
  components: {
    RakutenApiSideMenu,
    RakutenApiCall,
    RelationshipRakutenApiCall,
    RakutenApiResultList,
    RakutenApiResultHit,
    RakutenApiPagenation,
  },
};
</script>

<style scoped></style>
