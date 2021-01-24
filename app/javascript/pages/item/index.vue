<template>
  <div>
    <div>
      <RakutenApiCall></RakutenApiCall>
      <RakutenApiResultHit></RakutenApiResultHit>
      <RakutenApiResultList></RakutenApiResultList>
      <RakutenApiPagenation></RakutenApiPagenation>
    </div>
  </div>
</template>

<script>
import RakutenApiCall from "./components/RakutenApiCall.vue";
import RakutenApiResultList from "./components/RakutenApiResultList.vue";
import RakutenApiResultHit from "./components/RakutenApiResultHit.vue";
import RakutenApiPagenation from "./components/RakutenApiPagenation.vue";

export default {
  name: "ItemIndex",
  components: {
    RakutenApiCall,
    RakutenApiResultList,
    RakutenApiResultHit,
    RakutenApiPagenation,
  },
};
</script>

<style scoped></style>
