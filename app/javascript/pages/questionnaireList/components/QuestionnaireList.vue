<template>
  <div class="questionnaire-list">
    <template v-for="questionnaire in questionnaires">
      <QuestionnaireItem
        :key="questionnaire.id"
        :questionnaire="questionnaire"
        class="questionnaire-item"
      />
    </template>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
import QuestionnaireItem from "./QuestionnaireItem.vue";

export default {
  name: "QuestionnaireList",
  components: {
    QuestionnaireItem,
  },
  data() {
    return {
      questionnaires: [],
    };
  },
  created() {
    this.getQuestionnaires();
  },
  methods: {
    getQuestionnaires() {
      this.$axios
        .get("/v1/questionnaires")
        .then((res) => {
          this.$data.questionnaires = res.data;
          // for (let key of Object.keys(res)) {
          //   console.log(key);
          //   console.log(res[key]);
          // }
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style scoped>
.questionnaire-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  padding-top: 5rem;
}
.questionnaire-item {
  width: 48%;
  margin: 0 0.5rem 5rem 0.5rem;
}
@media screen and (max-width: 959px) {
  .questionnaire-item {
    width: 40%;
    margin: 0 0.5rem 5rem 0.5rem;
  }
}
@media screen and (max-width: 480px) {
  .questionnaire-list {
    padding-top: 2rem;
  }
  .questionnaire-item {
    width: 90%;
    margin: 0 0.5rem 2rem 0.5rem;
  }
}
</style>
