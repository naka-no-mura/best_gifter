<template>
  <div class="section">
    <h2 class="title my-q-tl">
      アンケート結果
    </h2>
    <div class="q-ads">
      <p>アンケートを投稿して<br>ギフトを厳選してみましょう！</p>
      <b-icon
        icon="gift-outline"
        size="is-large"
        class="mypage-gift-icon"
      /><br>
      <router-link
        to="/questionnaire_form"
        class="button q-ads-button"
      >
        投稿する
      </router-link>
    </div>
    <div class="my-q-items">
      <template v-for="questionnaire in questionnaires">
        <MyQuestionnaireItem
          :key="questionnaire.id"
          :questionnaire="questionnaire"
          class="my-q-item"
          @after-delete="getQuestionnaires"
        />
      </template>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import axios from "../../../plugins/axios";
import MyQuestionnaireItem from "./MyQuestionnaireItem.vue";
export default {
  name: "MyQuestionnaire",
  components: {
    MyQuestionnaireItem,
  },
  data() {
    return {
      questionnaires: [],
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  created() {
    this.getQuestionnaires();
  },
  methods: {
    getQuestionnaires() {
      this.$axios
        .get("/v1/questionnaires/my_questionnaires", {
          params: {
            user_id: this.authUser.id,
          },
        })
        .then((res) => {
          this.$data.questionnaires = res.data;
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style lang="scss">
.q-ads {
  border-radius: 1rem;
  background-color: white;
  margin: 1rem;
  padding: 3rem 1rem;
  text-align: center;
}
.inner-box {
  background-color: #f0eee9;
}
.mypage-gift-icon {
  color: #ffd3d4;
  margin: 1rem;
}
.q-ads-button {
  background-color: #ffd3d4 !important;
  border: 5px solid #ffd3d4 !important;
  transition: 0.3s !important;
}
.q-ads-button:hover {
  background-color: white !important;
  border: 5px solid #ffd3d4 !important;
}
.my-q-tl {
  text-align: center;
}
@media screen and (max-width: 480px) {
  .q-ads {
    margin: 1rem  auto;
  }
}
</style>
