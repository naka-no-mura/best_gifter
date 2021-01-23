<template>
  <div>
    <div>
      <RakutenApiCall></RakutenApiCall>
      <RakutenApiResultHit></RakutenApiResultHit>
      <RelationshipRakutenApiCall></RelationshipRakutenApiCall>
      <RakutenApiResultList></RakutenApiResultList>
      <RakutenApiPagenation></RakutenApiPagenation>
    </div>
  </div>
</template>

<script>
import RakutenApiCall from "./components/RakutenApiCall.vue";
import RelationshipRakutenApiCall from "./components/RelationshipRakutenApiCall.vue";
import RakutenApiResultList from "./components/RakutenApiResultList.vue";
import RakutenApiResultHit from "./components/RakutenApiResultHit.vue";
import RakutenApiPagenation from "./components/RakutenApiPagenation.vue";

export default {
  name: "ItemIndex",
  components: {
    RakutenApiCall,
    RelationshipRakutenApiCall,
    RakutenApiResultList,
    RakutenApiResultHit,
    RakutenApiPagenation,
  },
};
</script>

<style scoped></style>
