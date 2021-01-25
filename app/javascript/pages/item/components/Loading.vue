<template>
  <div>
    <div class="fullview">
      <div class="loading-spacer"></div>
      <vue-loading
        type="spiningDubbles"
        color="#aaa"
        :size="{ width: '80px', height: '80px' }"
      >
      </vue-loading>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { VueLoading } from "vue-loading-template";

export default {
  name: "loading",
  components: {
    VueLoading,
  },
  computed: {
    ...mapGetters(["count"]),
  },
};
</script>

<style>
.fullview {
  width: 100%;
  height: 100%;
  background: #fefefe;
  position: fixed;
  top: 0;
  left: 0;
}
.loading-spacer {
  height: 30%;
}
</style>
