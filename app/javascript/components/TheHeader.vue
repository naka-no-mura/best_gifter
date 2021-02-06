<template>
  <b-navbar fixed-top>
    <template #brand>
      <b-navbar-item>
        <img :src="logo_img" alt = "ロゴ" />
      </b-navbar-item>
    </template>
    <template #end>
      <b-navbar-item tag="div">
        <div class="buttons">
          <router-link to="/" class="button is-warning">トップ</router-link>
          <router-link to="/items" class="button is-warning">検索</router-link>
          <router-link to="/questionnaries" class="button is-warning">アンケート</router-link>
          <template v-if="!authUser">
          <router-link to="register" class="button is-warning">新規登録</router-link>
          <router-link to="/login" class="button is-warning">ログイン</router-link>
          </template>
          <template v-else>
          <router-link to="/logout" class="button is-warning" @click.native="handleLogout">ログアウト</router-link>
          </template>
          <router-link to="/" class="button is-warning">
          <b-icon icon="account-outline" size="is-medium"></b-icon></router-link>
          
        </div>
      </b-navbar-item>
    </template>
  </b-navbar>
</template>

<script>
import { mapGetters, mapActions } from "vuex"
export default {
  name: "TheHeader",
  data() {
    return {
      title: "Best Gifter",
      logo_img: require("../../assets/images/header_logo.png"),
      icon_img: require("../../assets/images/person-circle.svg"),
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"])
  },
  methods: {
    ...mapActions("users", ["logoutUser"]),
    async handleLogout() {
      try {
        await this.logoutUser()
        this.$router.push({name: 'TopIndex'})
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>

<style scoped>
</style>
