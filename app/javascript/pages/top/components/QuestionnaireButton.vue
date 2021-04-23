<template>
  <div class="container">
    <template v-if="!authUser">
      <button
        class="button is-large q-btn is-rounded pc-ver"
        @click="changeIsActive()"
      >
        アンケートに投票してみんなのギフトを見てみる
        <b-icon class="q-icon" icon="menu-right" size="is-large" />
      </button>
      <button
        class="button is-midium q-btn is-rounded ip-ver"
        @click="changeIsActive()"
      >
        アンケートに投票してみんなのギフトを見てみる
        <b-icon class="q-icon" icon="menu-right" size="is-midium" />
      </button>
      <button
        class="button is-small q-btn is-rounded sp-ver"
        @click="changeIsActive()"
      >
        アンケートに投票してみんなのギフトを見てみる
        <b-icon class="q-icon" icon="menu-right" size="is-small" />
      </button>
      <div class="modal" :class="{ 'is-active': isActive }">
        <div class="modal-background" @click="changeIsActive()"></div>
        <div class="modal-content">
          <router-link to="/login">
            <button class="button is-large q-btn is-rounded">
              ログインして投票する
              <b-icon class="q-icon" icon="menu-right" size="is-small" />
            </button> </router-link
          ><br />
          <button class="button is-large q-btn is-rounded" @click="gAccountToVote()">
            アカウントを作成せず投票する
            <b-icon class="q-icon" icon="menu-right" size="is-small" />
          </button>
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
          <b-icon class="q-icon" icon="menu-right" size="is-large" />
        </button>
        <button class="button is-midium q-btn is-rounded ip-ver">
          アンケートに投票してみんなのギフトを見てみる
          <b-icon class="q-icon" icon="menu-right" size="is-midium" />
        </button>
        <button class="button is-small q-btn is-rounded sp-ver">
          アンケートに投票してみんなのギフトを見てみる
          <b-icon class="q-icon" icon="menu-right" size="is-small" />
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
      user: {
        name: "投票のための一時的なアカウント",
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
    async gAccountToVote() {
      // const tmp_email = Math.floor(Math.random() * 100000000000000000).toString(36) + '@tmp.com';
      // const tmp_password = "password";

      const user = {
        name: "投票のための一時的なアカウント",
        email: Math.floor(Math.random() * 100000000000000000).toString(36) + '@tmp.com',
        password: "password",
        password_confirmation: "password",
      }

      // this.user.email = Math.floor(Math.random() * 100000000000000000).toString(36) + '@tmp.com';

      const register = async function() {
        try {
        await axios.post("/v1/users", { user: this.user })
        } catch(err) {
          console.log(err)
        }
        // await axios.post("/v1/users", {
        //   name: '投票のための一時的なアカウント',
        //   email: tmp_email,
        //   password: tmp_password,
        //   password_confirmation: tmp_password,
        // });
      };

      const login = async function() {
        await this.loginUser(this.user);
        this.$router.push("/questionnaire_list")
      };

      const tmpGenAccount = async function() {
        await register();
        await login();
      };

      tmpGenAccount()
        .then((res) =>
          this.$toasted.success('投票のための一時的なアカウントを作成しました。'),
        )
        .catch((err) =>
          // this.$toasted.error(err.response.data.message)
          this.$toasted.error(err.response)
        );
    },
  },
};
</script>
<style scoped>
.q-btn {
  background-color: #ffd3d4 !important;
  border: 5px solid #ffd3d4 !important;
  transition: 0.3s;
  color: white;
  justify-content: center;
  margin-top: 1rem;
  text-shadow: 0 0 0.3rem #333;
}
.q-btn:hover {
  background-color: white !important;
  color: #333333;
  text-shadow: 0 0 0 #333;
}
.q-icon {
  margin-left: 0.5rem !important;
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
    margin: 0 auto;
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
