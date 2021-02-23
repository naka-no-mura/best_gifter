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
      return this.$axios
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

<style lang="scss">
.questionnaire-list {
  display: flex;
  flex-wrap:wrap;
}
.questionnaire-item {
  width: 50%;
}
</style>
