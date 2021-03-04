<template>
  <div class="container login-page">
    <div class="block">
      <p><img src="../../../assets/images/logo_light_pink.JPG" /></p>
    </div>
    <div class="section login-form">
      <h1 class="title">
        ログイン
      </h1>
      <b-field label="メールアドレス" message="（例）example@example.com">
        <b-input v-model="user.email" type="email"></b-input>
      </b-field>
      <b-field label="パスワード" message="（例）password">
        <b-input v-model="user.password" type="password"></b-input>
      </b-field>
      <b-button class="login" type="submit" @click="login">
        ログイン
      </b-button>
      <b-button class="login" type="submit" @click="gestLogin">
        ゲストログイン
      </b-button>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  name: "LoginIndex",
  data() {
    return {
      user: {
        email: "",
        password: "",
      },
      gest: {
        email: "gest@gest.com",
        password: "password"
      }
    };
  },
  methods: {
    ...mapActions("users", ["loginUser", "fetchUser"]),
    async login() {
      try {
        await this.loginUser(this.user);
        this.$router.push({ name: "ItemIndex" });
      } catch (error) {
        console.log(error);
      }
    },
    async gestLogin() {
      try {
        await this.loginUser(this.gest);
        this.$router.push({ name: "ItemIndex" });
      } catch (error) {
        console.log(error);
      }
    }
  },
};
</script>

<style scoped>
img {
  width: 15%;
  margin: 0 auto;
}
.login-page {
  padding: 5rem 0;
}
.block {
  text-align: center;
}
.login {
  background-color: #ffd3d4;
  border: 5px solid #ffd3d4;
  transition: 0.3s;
}
.login:hover {
  background-color: white;
  border: 5px solid #ffd3d4;
}
.login-form {
  width: 50%;
  margin: 0 auto;
}
</style>
