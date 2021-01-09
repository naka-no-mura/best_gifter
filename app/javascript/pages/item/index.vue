<template>
  <div class="root">
    <RakutenApiCall></RakutenApiCall>
    <RakutenApiResult v-for="item in items" :item="item"></RakutenApiResult>
  </div>
</template>

<script>
import RakutenApiCall from "./components/RakutenApiCall.vue";
import RakutenApiResult from "./components/RakutenApiResult.vue";
import { mapGetters } from 'vuex';

export default {
  name: "ItemIndex",
  components: {
    RakutenApiCall,
    RakutenApiResult,
  },
  computed: {
    ...mapGetters(['items'])
  }
}
</script>

<style scoped>
</style>
