<template>
  <div class="container login-page">
    <div class="block">
      <p><img src="../../../assets/images/logo_light_pink.JPG"></p>
    </div>
    <div class="section login-form">
      <h1 class="title">
        ログイン
      </h1>
      <b-field
        label="メールアドレス"
        message="（例）example@example.com"
      >
        <b-input
          id="login-email"
          v-model="user.email"
          type="email"
        />
      </b-field>
      <span
        v-if="errors.email"
        class="error-message"
      >{{ errors.email }}</span>
      <b-field
        label="パスワード"
        message="（例）password"
      >
        <b-input
          id="login-password"
          v-model="user.password"
          type="password"
        />
      </b-field>
      <span
        v-if="errors.password"
        class="error-message"
      >{{ errors.password }}</span>
      <p>
        <b-button
          id="login-btn"
          class="login"
          type="submit"
          expanded
          style="margin:1rem 0"
          @click="login"
        >
          ログイン
        </b-button>
      </p>
      <p class="gest-login">
        アカウント登録をせず機能を試したい方は<a
          id="login-gest-btn"
          @click="gestLogin"
        >こちら</a>
      </p>
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
      },
      errors: {
        email: '',
        password: ''
      }
    };
  },
  methods: {
    ...mapActions("users", ["loginUser", "fetchUser"]),
    async login() {
      try {
        await this.loginUser(this.user);
        this.$router.push({ name: "ItemIndex" });
        this.$toasted.success("ログインしました");
      } catch (error) {
        console.log(error);
        this.errors.email = "正しいメールアドレスを入力してください"
        this.errors.password = "正しいパスワードを入力してください"
      }
    },
    async gestLogin() {
      try {
        await this.loginUser(this.gest);
        this.$router.push({ name: "ItemIndex" });
        this.$toasted.success("ログインしました");
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
  padding: 7rem 0;
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
.error-message {
  color: red;
  margin-left: 1rem;
  padding-bottom: 1rem;
}
#login-gest-btn {
  text-decoration: underline;
}
#login-gest-btn:hover {
  opacity: 0.5;
}
@media screen and (max-width: 480px) {
  .login-page {
    text-align: center;
  }
img {
  width: 50%;
}
.login-form {
  width: 95%;
}
}
</style>
