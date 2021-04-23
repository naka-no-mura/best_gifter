<template>
  <div class="container register-page">
    <div class="block register-logo">
      <p><img src="../../../assets/images/logo_medium_pink.JPG"></p>
    </div>
    <div class="register-box">
      <div class="register-item">
        <div class="section">
          <h1
            class="title"
            style="text-align:center"
          >
            新規登録
          </h1>
          <div class="block merit">
            <h2 class="subtitle">
              検索した商品を<b><big>お気に入り登録</big></b>できるようになります。
            </h2>
            <p>検索だけであれば新規登録せずにご利用頂けます。</p>
          </div>
          <div class="block merit">
            <h2 class="subtitle">
              <b><big>アンケート機能</big></b>がご利用できるようになります。
            </h2>
            <p>投稿したり、他のユーザーのアンケートに投票して結果を参考できるようになるます。</p>
          </div>
        </div>
      </div>
      <div class="register-item">
        <div class="section">
          <div id="register-form">
            <b-field
              label="ニックネーム"
              class="r-f"
              message="（例）ギフター"
            >
              <b-input
                id="register-name"
                v-model="user.name"
                type="text"
              />
            </b-field>
            <span
              v-if="errors.name"
              class="error-message"
            >
              <p
                v-for="error in errors.name"
                :key="error.id"
              >{{ error }}</p>
            </span>
            <b-field
              label="メールアドレス"
              class="r-f"
              message="（例）best@gifter.com"
            >
              <b-input
                id="register-email"
                v-model="user.email"
                type="email"
              />
            </b-field>
            <span
              v-if="errors.email"
              class="error-message"
            >
              <p
                v-for="error in errors.email"
                :key="error.id"
              >{{ error }}</p>
            </span>
            <b-field
              label="パスワード"
              class="r-f"
              message="（例）password ※３文字以上30文字以下で入力してください"
            >
              <b-input
                id="register-password"
                v-model="user.password"
                type="password"
                password-reveal
              />
            </b-field>
            <span
              v-if="errors.password"
              class="error-message"
            >
              <p
                v-for="error in errors.password"
                :key="error.id"
              >{{ error }}</p>
            </span>
            <b-field
              label="パスワード（確認）"
              class="r-f"
              message="（例）password"
            >
              <b-input
                id="register-password-confirmation"
                v-model="user.password_confirmation"
                type="password"
                password-reveal
              />
            </b-field>
            <span
              v-if="errors.password_confirmation"
              class="error-message"
            >
              <p
                v-for="error in errors.password_confirmation"
                :key="error.id"
              >{{ error }}</p>
            </span>
            <p class="terms-check">
              <label
                class="checkbox"
                @click="termesCheck()"
              >
                <input
                  id="register-check"
                  type="checkbox"
                  style="margin-right:0.5rem"
                >
                <router-link
                  to="/terms"
                  class="terms"
                >利用規約</router-link>に同意する
              </label>
            </p>
            <p v-if="isChecked === true">
              <b-button
                id="register-btn"
                class="register"
                type="submit"
                expanded
                @click="register"
              >
                登録（無料）
              </b-button>
            </p>
            <p v-else>
              <b-button
                class="register"
                type="submit"
                expanded
                disabled
                @click="register"
              >
                登録（無料）
              </b-button>
            </p>
            <p class="gest-login">
              アカウント登録をせず機能を試したい方は<a
                id="register-gest"
                @click="gestLogin"
              >こちら</a>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  name: "RegisterIndex",
  data() {
    return {
      user: {
        name: "",
        email: "",
        password: "",
        password_confirmation: "",
      },
      gest: {
        email: "gest@gest.com",
        password: "password"
      },
      errors: '',
       isChecked: false,
    };
  },
  methods: {
    ...mapActions("users", ["loginUser", "fetchUser"]),
    register() {
      this.$axios
        .post("/v1/users", { user: this.user })
        .then((res) => {
          this.$router.push({ name: "LoginIndex" });
        })
        .catch((error) => {
          console.log(error);
          this.errors = error.response.data.errors
        });
    },
    async gestLogin() {
      try {
        await this.loginUser(this.gest);
        this.$router.push({ name: "ItemIndex" });
        this.$toasted.success("ログインしました");
      } catch (error) {
        console.log(error);
      }
    },
    termesCheck() {
      this.isChecked = !this.isChecked
    }
  },
};
</script>

<style scoped>
img {
  width: 15%;
  margin: 0 auto;
}
.register-page {
  padding-top: 7rem;
}
.register-logo {
  text-align: center;
}
.register-box {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.register-item {
  width: 50%;
}
.merit {
  padding: 2rem;
  border: 5px solid #ffd3d4;
  border-radius: 15px;
}
.register {
  background-color: #ffd3d4;
  border: 5px solid #ffd3d4;
  transition: 0.3s ;
}
.register:hover {
  background-color: white;
  border: 5px solid #ffd3d4;
}
.error-message {
  color: red;
}
.terms {
  text-decoration: underline;
}
.terms:hover {
  opacity: 0.4;
}
.terms-check {
  margin: 1rem;;
}
.r-f {
  margin: 2rem 0 0 !important;
}
a {
  text-decoration-line: underline;
}
a:hover {
  opacity: 0.5;
}
.gest-login {
  margin: 1rem auto;
}
@media screen and (max-width: 480px) {
img {
  width: 50%;
}
.register-page {
  width: 95%;
}
.register-box {
  display: block;
  text-align: center;
}
.register-item {
  width: 100%;
}
}
</style>
