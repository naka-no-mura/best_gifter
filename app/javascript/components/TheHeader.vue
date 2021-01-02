<template>
  <header class="mb-auto">
    <nav class="navbar fixed-top navbar-expand navbar-light bg-light justify-content-between">
      <img v-bind:src="logo_img" width="8%" alt = "ロゴ" />
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">検索</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">相場とおすすめ</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">新規登録</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">ログイン</a>
      </li>
      <li class="nav-item">
        <img v-bind:src="icon_img" width="" alt = "アイコン" width="200%" />
      </li>
    </ul>
    </nav>
  </header>
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
