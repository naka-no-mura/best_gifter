<template>
  <div class="container">
    <template v-if="!authUser">
      <button
        class="button is-large q-btn is-rounded pc-ver"
        @click="changeIsActive(); gTmpEmail();"
      >
        アンケートに投票してみんなのギフトを参考にする
      </button>
      <button
        class="button is-midium q-btn is-rounded ip-ver"
        @click="changeIsActive(); gTmpEmail();"
      >
        アンケートに投票してみんなのギフトを参考にする
      </button>
      <button
        class="button is-small q-btn is-rounded sp-ver"
        @click="changeIsActive(); gTmpEmail();"
      >
        アンケートに投票してみんなのギフトを参考にする
      </button>
      <div class="modal" :class="{ 'is-active': isActive }">
        <div class="modal-background" @click="changeIsActive()"></div>
        <div class="modal-content">
          <router-link to="/login">
            <p class="q-tx">自分のアカウントで</p>
            <button class="button q-btn q-m-btn is-fullwidth is-rounded">
              ログインして投票する
            </button> </router-link
          ><br />
          <br />
          <br />
          <p class="q-tx">一時的な投票用アカウントを</p>
          <template v-if="!loginForVote">
            <button class="button q-btn q-m-btn is-fullwidth is-rounded" disabled @click="register()">
              ① 作成して
            </button>
          </template>
          <template v-else>
            <button class="button q-btn q-m-btn is-fullwidth is-rounded" @click="register()">
              ① 作成して
            </button>
          </template>
          <br />
          <template v-if="!gAccountForVote">
            <button class="button q-btn q-m-btn is-fullwidth is-rounded" disabled @click="login()">
              ② ログインする
            </button>
          </template>
          <template v-else>
            <button class="button q-btn q-m-btn is-fullwidth is-rounded" @click="login()">
              ② ログインする
            </button>
          </template>
        </div>
        <button
          class="modal-close is-large"
          aria-label="close"
          @click="changeIsActive()"
        ></button>
      </div>
    </template>
    <template v-else>
      <router-link to="/questionnaire_list">
        <button class="button is-large q-btn is-rounded pc-ver">
          アンケートに投票してみんなのギフトを見てみる
        </button>
        <button class="button is-midium q-btn is-rounded ip-ver">
          アンケートに投票してみんなのギフトを見てみる
        </button>
        <button class="button is-small q-btn is-rounded sp-ver">
          アンケートに投票してみんなのギフトを見てみる
        </button>
      </router-link>
    </template>
  </div>
</template>
<script>
import axios from "../../../plugins/axios";
import { mapGetters, mapActions } from "vuex";
export default {
  name: "QuestionnaireButton",
  data() {
    return {
      isActive: false,
      gAccountForVote: false,
      loginForVote: true,
      user: {
        name: "投票用の一時的なアカウント",
        email: "",
        password: "password",
        password_confirmation: "password",
      },
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    changeIsActive() {
      this.isActive = !this.isActive;
    },
    ...mapActions("users", ["loginUser", "fetchUser"]),

    gTmpEmail() {
      this.user.email = Math.floor(Math.random() * 100000000000000000).toString(36) + '@tmp.com'
    },

    register() {
      this.$axios
        .post("/v1/users", { user: this.user })
        .catch((error) => {
          console.log(error);
          this.errors = error.response.data.errors
        });
      this.gAccountForVote = true,
      this.loginForVote = false
    },

    async login() {
      const user = {
        email: this.user.email,
        password: "password",
      }
      try {
        await this.loginUser(user);
        this.$router.push({ name: "QuestionnaireListIndex" });
        this.$toasted.success("投票用アカウントでログイン（お気に入り登録とアンケート投稿は保存されません）");
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
<style scoped>
.q-btn {
  background-color: #77c7f7 !important;
  border: 5px solid #77c7f7 !important;
  transition: 0.3s;
  color: white;
  margin-top: 1rem;
}

.q-m-btn {
  width: 80% !important;
  margin: 0 auto;
}
.q-btn:hover {
  background-color: white !important;
  color: #333333;
  text-shadow: 0 0 0 #333;
}
.q-tx {
  color: white;
  text-align: center;
}
.ip-ver {
  display: none;
}
.sp-ver {
  display: none;
}
@media screen and (max-width: 959px) {
  .pc-ver {
    display: none;
  }
  .sp-ver {
    display: none;
  }
  .ip-ver {
    display: block;
  }
  .q-btn {
    margin: 0rem auto 0;
  }
  .q-icon {
    margin-left: 0.3rem !important;
  }
}
@media screen and (max-width: 480px) {
  .pc-ver {
    display: none;
  }
  .ip-ver {
    display: none;
  }
  .sp-ver {
    display: block;
    margin-top: 1rem;
  }
  .q-btn {
    margin: 0 auto;
  }
  .q-icon {
    margin-left: 0.1rem !important;
  }
}
</style>
