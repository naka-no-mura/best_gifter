<template>
  <div class="container is-fluid">
  <div class="notification is-primary">
    <RakutenApiCall></RakutenApiCall>
    <RakutenApiResult :items="items"></RakutenApiResult>
  </div>
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
