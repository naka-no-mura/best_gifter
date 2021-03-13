<template>
  <div class="container error-box">
    <p class="error-logo">
      <img src="../../../assets/images/logo_no_color.JPG">
    </p>
    <div class="tx">
      <p>お探しのページが見つかりませんでした。</p>
      <p>一時的にアクセスができない状況にあるか</p>
      <p>移動もしくは削除された可能性があります。</p>
      <p>URLにお間違いがないか再度ご確認ください。</p>
      <router-link
        to="/"
        class="button"
      >
        <span @click="pageToTop()">トップページに戻る</span>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "NotFoundIndex",
  methods: {
    pageToTop() {
      window.scrollTo({
        top: 0,
        behavior: "auto",
      });
    },
  }
}
</script>

<style scoped>
.error-box {
  text-align: center;
}
.error-logo {
  padding-top: 10rem;
}
img {
  width: 30%;
}
.tx {
  line-height: 2rem;
  padding: 3rem 0;
}
.button {
  background-color: #ffd3d4;
  border: 5px solid #ffd3d4;
  transition: 0.3s;
  margin-top: 2rem;
}
.button:hover {
  background-color: white;
  border: 5px solid #ffd3d4;
}
@media screen and (max-width: 480px) {
  img {
    width: 80%;
  }
.error-logo {
  padding-top: 5rem;
}
}
</style>
