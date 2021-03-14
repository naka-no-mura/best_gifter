<template>
  <div>
    <div class="fullview">
      <div class="loading-spacer" />
      <vue-loading
        type="spiningDubbles"
        color="#aaa"
        :size="{ width: '80px', height: '80px' }"
      />
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { VueLoading } from "vue-loading-template";

export default {
  name: "Loading",
  components: {
    VueLoading,
  },
  computed: {
    ...mapGetters("rakuten_api", ["count"]),
  },
};
</script>

<style>
.fullview {
  width: 100%;
  height: 100%;
  background: #f0eee9;
  position: fixed;
  top: 0;
  left: 0;
}
.loading-spacer {
  height: 30%;
}
</style>
