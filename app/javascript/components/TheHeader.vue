<template>
  <b-navbar fixed-top transparent>
    <template #brand>
      <b-navbar-item class="logo">
        <img :src="logo_img" alt="ロゴ" />
      </b-navbar-item>
    </template>
    <template #end>
      <b-navbar-item tag="div">
        <div class="buttons">
          <router-link to="/" class="button">トップ</router-link>
          <router-link to="/items" class="button">検索</router-link>
          <router-link to="/questionnaires" class="button"
            >アンケート</router-link
          >
          <template v-if="!authUser">
            <router-link to="register" class="button"
              >新規登録</router-link
            >
            <router-link to="/login" class="button"
              >ログイン</router-link
            >
          </template>
          <template v-else>
            <router-link
              to="/logout"
              class="button"
              @click.native="handleLogout"
              >ログアウト</router-link
            >
          </template>
          <router-link to="/mypage" class="button" v-if="authUser">
            <b-icon icon="account-outline" size="is-medium"></b-icon
          ></router-link>
        </div>
      </b-navbar-item>
    </template>
  </b-navbar>
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
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    ...mapActions("users", ["logoutUser"]),
    async handleLogout() {
      try {
        await this.logoutUser();
        this.$router.push({ name: "TopIndex" });
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>

<style scoped>
.button {
  background-color: #ffd3d4;
  border: 5px solid #ffd3d4;
  transition: 0.3s ;
}
.button:hover {
  background-color: white;
  border: 5px solid #ffd3d4;
}
</style>
