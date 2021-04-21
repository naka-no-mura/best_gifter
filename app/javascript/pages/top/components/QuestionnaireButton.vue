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
        <div class="modal-content" @click="changeIsActive()">
          <router-link to="/login">
            <button class="button is-large q-btn is-rounded">
              ログインして投票する
              <b-icon class="q-icon" icon="menu-right" size="is-small" />
            </button> </router-link
          ><br />
          <button class="button is-large q-btn is-rounded" @click="randomRegister()">
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
import { mapGetters, mapActions } from "vuex";
export default {
  name: "QuestionnaireButton",
  data() {
    return {
      isActive: false,
      user: {
        name: "",
        email: "",
        password: "",
        password_confirmation: "",
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
    randomRegister() {
      this.$axios
        .post("/v1/users", { user: this.user })
        .then((res) => {
          this.$router.push({ name: "QuestionnaireListIndex" });
        })
        .catch((error) => {
          console.log(error);
          this.errors = error.response.data.errors
        });
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
