<template>
<div class="container register-page">
<div class="block register-logo">
<p><img src="../../../assets/images/logo_medium_pink.JPG"></p>
</div>
<div class="register-box">
  <div class="register-item">
    <div class="section">
      <h1 class="title" style="text-align:center">新規登録</h1>
      <div class="block merit">
          <h2 class="subtitle">検索した商品を<b><big>お気に入り登録</big></b>できるようになります。</h2>
          <p>検索だけであれば新規登録せずにご利用頂けます。</p>
      </div>
      <div class="block merit">
        <h2 class="subtitle"><b><big>アンケート機能</big></b>がご利用できるようになります。</h2>
        <p>投稿したり、他のユーザーのアンケートに投票して結果を参考できるようになるます。</p>
      </div>
    </div>
  </div>
  <div class="register-item">
<div class="section">
  <div id="register-form">
    <b-field label="ニックネーム"
        message="（例）ギフター">
      <b-input
        v-model="user.name"
        type="text"
      ></b-input>
    </b-field>
      <span class="error-message" v-if="errors.name">{{ errors.name }}</span>
    <b-field label="メールアドレス" message="（例）best@gifter.com">
      <b-input
        v-model="user.email"
        type="email"
      /></b-input>
    </b-field>
      <span class="error-message" v-if="errors.email">{{ errors.email }}</span>
    <b-field label="パスワード" message="（例）password">
      <b-input
        v-model="user.password"
        type="password"
        password-reveal
      /></b-input>
    </b-field>
      <span class="error-message" v-if="errors.password">{{ errors.password }}</span>
    <b-field label="パスワード（確認）" message="（例）password">
      <b-input
        v-model="user.password_confirmation"
        type="password"
        password-reveal
      /></b-input>
    </b-field>
      <span class="error-message" v-if="errors.password_confirmation">{{ errors.password_confirmation }}</span>
      <p class="terms-check">
        <label class="checkbox"  @click="termesCheck()">
          <input type="checkbox" style="margin-right:0.5rem">
            <router-link to="/terms" class="terms">利用規約</router-link>に同意する
          </label>
      </p>
    <p v-if="isChecked === true"><b-button class="register" type="submit" expanded @click="register">
      登録（無料）
    </b-button></p>
    <p v-else><b-button class="register" type="submit" expanded @click="register" disabled>
      登録（無料）
    </b-button></p>
  </div>
  </div>
  </div>
  </div>
  </div>
</template>

<script>
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
      errors: {
      name: '',
      email: '',
      password: '',
      password_confirmation: '',
      },
       isChecked: false,
    };
  },
  methods: {
    register() {
      this.$axios
        .post("/v1/users", { user: this.user })
        .then((res) => {
          this.$router.push({ name: "LoginIndex" });
        })
        .catch((error) => {
          console.log(error);
          this.errors.name = error.response.data.errors.name[0]
          this.errors.email = error.response.data.errors.email[0]
          this.errors.password = error.response.data.errors.password[0]
          this.errors.password_confirmation = error.response.data.errors.password_confirmation[0]
        });
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
  padding-top: 5rem;
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
  margin-left: 1rem;
  padding-bottom: 1rem;
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
