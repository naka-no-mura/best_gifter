<template>
  <div class="section questionnaire-item">
    <div>
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
    <router-link
      :to="`/questionnaire_list/${questionnaire.id}`"
      class="button tw-btn"
    >Twitterでシェアする　<b-icon icon="menu-right" size="is-medium"></b-icon>
    </router-link>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
import { mapGetters } from "vuex";
export default {
  name: "QuestionnaireItem",
  props: {
    questionnaire: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      options: {
        question: "",
        answers: [
          {
            value: this.questionnaire.questionnaire_choices[0].id,
            text: this.questionnaire.questionnaire_choices[0].choice,
            votes: this.questionnaire.questionnaire_choices[0].answers_count,
          },
          {
            value: this.questionnaire.questionnaire_choices[1].id,
            text: this.questionnaire.questionnaire_choices[1].choice,
            votes: this.questionnaire.questionnaire_choices[1].answers_count,
          },
          {
            value: this.questionnaire.questionnaire_choices[2].id,
            text: this.questionnaire.questionnaire_choices[2].choice,
            votes: this.questionnaire.questionnaire_choices[2].answers_count,
          },
        ],
      },
      radioButton: "",
      isClicked: true,
      isClickedTx: false,
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    addVote: function(obj) {
      return this.$axios
        .post("/v1/answers", {
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
};
</script>

<style scoped>
.questionnaire-item {
  -webkit-transition: 0.3s;
  transition: 0.3s;
  border-radius: 1rem;
  background-color: white;
  padding: 1rem;
  border: 5px solid white;
}
.questionnaire-item:hover {
  border: 5px solid #ffd3d4;
}
.gift-icon {
  color: #ffd3d4;
}
.gift-q-tl {
  border-bottom: 1px solid #ffd3d4;
  margin-bottom: 1rem;
}
.tw-btn {
  transition: 0.3s;
}
.tw-btn:hover {
  background-color: #77c7f7 !important;
  color: white !important;
}
</style>
