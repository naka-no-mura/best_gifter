<template>
  <div class="inner-box">
    <TheHeader />
    <router-view />
    <TheFooter />
    <div
      class="Page-Btn"
      @click="scrollTop"
    >
      <b-icon
        class="scroll-top"
        icon="arrow-up-drop-circle"
        size="is-large"
      />
    </div>
  </div>
</template>

<script>
  import TheHeader from 'pages/common/TheHeader.vue'
  import TheFooter from 'pages/common/TheFooter.vue'

  export default {
    components: {
      TheHeader,
      TheFooter,
    },
    methods: {
      scrollTop() {
      window.scrollTo({
        top: 0,
        behavior: "smooth"
      });
      }
  },
  };
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Sawarabi+Mincho&display=swap');
.inner-box {
  font-family: 'Sawarabi Gothic', sans-serif;
}
.Page-Btn{
  position: fixed;
  right: 14px;
  bottom: 14px;
  text-align: center;
  border-radius: 50%;
  color: #666666;
  z-index: 100;
}
</style>
