<template>
  <div class="section">
    <h2 class="title">アンケート結果</h2>
    <template v-for="questionnaire in questionnaires">
      <MyQuestionnaireItem
        :key="questionnaire.id"
        :questionnaire="questionnaire"
        @after-delete="getQuestionnaires"
      />
    </template>
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
  created() {
    this.getQuestionnaires();
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    getQuestionnaires() {
      this.$axios
        .get("/v1/questionnaires/my_questionnaires", {
          params: {
            user_id: this.authUser.id
          }
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
</style>
