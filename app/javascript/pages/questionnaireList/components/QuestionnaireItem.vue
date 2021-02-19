<template>
  <div>
    <div class="section">
      <vue-poll v-bind="options" @addvote="addVote()"></vue-poll>
    </div>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
export default {
  name: "QuestionnaireItem",
  props: {
    questionnaire: Object,
  },
  data() {
    return {
      options: {
        question: this.questionnaire.text,
        answers: [
          { value: this.questionnaire.questionnaire_id, text: this.questionnaire.questionnaire_choices.[0].choice, votes: 53 },
          { value: this.questionnaire.questionnaire_id, text: this.questionnaire.questionnaire_choices.[1].choice, votes: 35 },
          { value: this.questionnaire.questionnaire_id, text: this.questionnaire.questionnaire_choices.[2].choice, votes: 30 },
        ],
      },
    }
  },
};
</script>

<style lang="scss"></style>
