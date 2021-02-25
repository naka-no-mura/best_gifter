<template>
    <div class="section my-q-item">
      <div>
        <p>ギフトを贈りたい相手の</p>
        <p>間柄：{{ questionnaire.relationship }}</p>
        <p>性別：{{ questionnaire.gender }}</p>
        <p>年齢：{{ questionnaire.age }}</p>
        <p>内容：{{ questionnaire.text }}</p>
      </div>
        <vue-poll v-bind="options" finalResults></vue-poll>
    </div>
</template>

<script>
import axios from "../../../plugins/axios";
import { mapGetters } from "vuex";
export default {
  name: "MyQuestionnaireItem",
  props: {
    questionnaire: Object,
  },
  data() {
    return {
      options: {
        question: "",
        answers: [
          { value: this.questionnaire.questionnaire_choices[0].id, text: this.questionnaire.questionnaire_choices[0].choice, votes: this.questionnaire.questionnaire_choices[0].answers_count },
          { value: this.questionnaire.questionnaire_choices[1].id, text: this.questionnaire.questionnaire_choices[1].choice, votes: this.questionnaire.questionnaire_choices[1].answers_count },
          { value: this.questionnaire.questionnaire_choices[2].id, text: this.questionnaire.questionnaire_choices[2].choice, votes: this.questionnaire.questionnaire_choices[2].answers_count },
        ],
      },
      radioButton: '',
      isClicked: true,
      isClickedTx: false,
    }
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
};
</script>

<style lang="scss">
.my-q-item {
  border-radius: 1rem;
  background-color: #f8f8f8;
  margin: 1rem;
}
.my-q-item:hover {
  background-color: #f8f8f8;
}
</style>
