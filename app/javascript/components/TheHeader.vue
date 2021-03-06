<template>
  <nav
    class="navbar is-fixed-top"
    role="navigation"
    aria-label="main navigation"
  >
    <div class="navbar-brand">
      <p class="navbar-item">
        <img src="../../assets/images/logo_header.JPG" />
      </p>
      <a
        role="button"
        class="navbar-burger"
        v-bind:class="{ 'is-active': isActive }"
        aria-label="menu"
        aria-expanded="false"
        data-target="navbarBasicExample"
        @click="changeIsActive()"
      >
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </a>
    </div>

    <div
      id="navbarBasicExample"
      class="navbar-menu"
      v-bind:class="{ 'is-active': isActive }"
    >
      <div class="navbar-start"></div>
      <div class="navbar-end">
        <router-link to="/" class="navbar-item nav-item">トップ</router-link>

        <router-link to="/items" class="navbar-item nav-item">検索</router-link>
        <template v-if="!authUser">
          <router-link to="register" class="navbar-item nav-item"
            >新規登録</router-link
          >

          <router-link to="/login" class="navbar-item nav-item"
            >ログイン</router-link
          >
        </template>
        <template v-else>
          <div class="navbar-item has-dropdown is-hoverable nav-item">
            <a class="navbar-link">
              アンケート
            </a>
            <div class="navbar-dropdown">
              <router-link to="/questionnaire_form" class="navbar-item"
                >投稿する</router-link
              >

              <router-link to="/questionnaire_list" class="navbar-item"
                >閲覧</router-link
              >
            </div>
          </div>
          <router-link
            to=""
            @click.native="handleLogout"
            class="nav-item navbar-item"
            >ログアウト</router-link
          >
        </template>
        <router-link to="/mypage" class="navbar-item nav-item" v-if="authUser">
          <b-icon icon="account-outline" size="is-medium"></b-icon
        ></router-link>
      </div>
    </div>
  </nav>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  name: "TheHeader",
  data() {
    return {
      title: "Best Gifter",
      logo_img: require("../../assets/images/logo_header.JPG"),
      icon_img: require("../../assets/images/person-circle.svg"),
      isActive: false,
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    ...mapActions("users", ["logoutUser"]),
    async handleLogout() {
      if (confirm("ログアウトしますか？"))
        try {
          this.logoutUser();
          this.$router.push({ name: "TopIndex" });
          this.$toasted.success("ログアウトしました");
        } catch (error) {
          console.log(error);
        }
    },
    changeIsActive() {
      this.isActive = !this.isActive;
    },
  },
};
</script>

<style scoped>
.button {
  background-color: #ffd3d4;
  border: 5px solid #ffd3d4;
  transition: 0.3s;
}
.button:hover {
  background-color: white;
  border: 5px solid #ffd3d4;
}
.nav-item {
  padding: 0 2rem;
}
</style>
