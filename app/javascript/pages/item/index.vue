<template>
  <div>
    <div>
      <RakutenApiCall></RakutenApiCall>
      <RakutenApiResultHit></RakutenApiResultHit>
      <RelationshipRakutenApiCall></RelationshipRakutenApiCall>
      <RakutenApiResultList :items="items"></RakutenApiResultList>
    </div>
  </div>
</template>

<script>
import RakutenApiCall from "./components/RakutenApiCall.vue";
import RelationshipRakutenApiCall from "./components/RelationshipRakutenApiCall.vue";
import RakutenApiResultList from "./components/RakutenApiResultList.vue";
import RakutenApiResultHit from "./components/RakutenApiResultHit.vue";
import { mapGetters } from "vuex";

export default {
  name: "ItemIndex",
  components: {
    RakutenApiCall,
    RelationshipRakutenApiCall,
    RakutenApiResultList,
    RakutenApiResultHit,
  },
  computed: {
    ...mapGetters(["items"]),
  },
};
</script>

<style scoped></style>
