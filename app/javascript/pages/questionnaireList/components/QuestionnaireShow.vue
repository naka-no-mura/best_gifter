<template>
  <div class="">
  <div style="padding-top:20rem" @click="getQuestionnaire()">とってくる</div>
    <div class="section">
      <p class="gift-q-tl">
        <b-icon
          icon="gift-outline"
          size="is-middium"
          class="gift-icon"
        /> ギフトを贈りたいお相手について
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        /> 間柄：{{ questionnaire.relationship }}
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        /> 性別：{{ questionnaire.gender }}
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        /> 年齢：{{ questionnaire.age }}
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        /> 内容：{{ questionnaire.text }}
      </p>
    </div>
    <div />
    <div class="answers">
      <vue-poll
        v-bind="options"
        @addvote="addVote"
      />
    </div>
  </div>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
import { mapGetters } from "vuex";

export default {
  name: "QuestionnaireShow",
  data() {
    return {
      questionnaire: "",
      options: {
        question: "",
        answers: [
          {
            value: '',
            text: '',
            votes: '',
          },
          {
            value: '',
            text: '',
            votes: '',
          },
          {
            value: '',
            text: '',
            votes: '',
          },
        ]
      }
    };
  },
  created() {
    this.getQuestionnaire();
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    getQuestionnaire() {
      this.$axios
        .get(`http://localhost:3000/api/v1/questionnaires/${this.$route.params.id}`)
        .then((res) => {
          this.$data.questionnaire = res.data;
          this.$data.options.answers[0].value = res.data.questionnaire_choices[0].id;
          this.$data.options.answers[0].text = res.data.questionnaire_choices[0].choice;
          this.$data.options.answers[0].votes = res.data.questionnaire_choices[0].answers_count;
          this.$data.options.answers[1].value = res.data.questionnaire_choices[1].id;
          this.$data.options.answers[1].text = res.data.questionnaire_choices[1].choice;
          this.$data.options.answers[1].votes = res.data.questionnaire_choices[1].answers_count;
          this.$data.options.answers[2].value = res.data.questionnaire_choices[2].id;
          this.$data.options.answers[2].text = res.data.questionnaire_choices[2].choice;
          this.$data.options.answers[2].votes = res.data.questionnaire_choices[2].answers_count;
          // console.log(res);
          // for (let key of Object.keys(res)) {
          //   console.log(key);
          //   console.log(res[key]);
          // }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    addVote: function(obj) {
      return this.$axios
        .post("http://localhost:3000/api/v1/answers", {
          user_id: this.authUser.id,
          questionnaire_choice_id: obj.value,
          questionnaire_id: this.questionnaire.id,
        })
        .then((res) => {
          console.log(res);
          this.$toasted.success('アンケートに投票しました');
        })
        .catch((error) => {
          console.log(error);
          this.$toasted.error(error.response.data.message);
        });
    },
  },
}
</script>

<style scoped>
</style>
