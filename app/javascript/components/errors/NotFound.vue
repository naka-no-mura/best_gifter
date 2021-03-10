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
      <span class="error-message" v-if="errors.email">{{ errors.email }}</span>
      <b-field label="パスワード" message="（例）password">
        <b-input v-model="user.password" type="password"></b-input>
      </b-field>
      <span class="error-message" v-if="errors.password">{{ errors.password }}</span>
      <p><b-button class="login" type="submit" expanded @click="login" style="margin:1rem 0">
        ログイン
      </b-button></p>
    <p class="gest-login">アカウント登録をせず機能を試したい方は<a @click="gestLogin">こちら</a></p>
    </div>
  </div>
</template>

<script>
export default {
  name: "NotFound",
}
</script>

<style scoped>
</style>
