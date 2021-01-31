<template>
  <b-navbar>
    <template #brand>
      <b-navbar-item>
        <img :src="logo_img" alt = "ロゴ" />
      </b-navbar-item>
    </template>
    <template #end>
      <b-navbar-item tag="div">
        <div class="buttons">
          <a class="button is-warning" href="#">検索</a>
          <a class="button is-warning" href="#">相場とおすすめ</a>
          <a class="button is-warning" href="#">新規登録</a>
          <a class="button is-warning" href="#">ログイン</a>
          <a class="button is-warning">
          <b-icon icon="account-outline" size="is-medium"></b-icon>
          </a>
        </div>
      </b-navbar-item>
    </template>
  </b-navbar>
</template>

<script>
export default {
  name: "TheHeader",
  data() {
    return {
      title: "Best Gifter",
      logo_img: require("../../assets/images/header_logo.png"),
      icon_img: require("../../assets/images/person-circle.svg"),
    }
  }
}
</script>

<style scoped>
</style>
