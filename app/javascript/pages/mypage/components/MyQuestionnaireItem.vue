<template>
  <div class="section my-q-item">
    <div>
      <p class="gift-q-tl">
        <b-icon
          icon="gift-outline"
          size="is-middium"
          class="gift-icon"
        />
        ギフトを贈りたい相手の
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        />
        間柄：{{ questionnaire.relationship }}
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        />
        性別：{{ questionnaire.gender }}
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        />
        年齢：{{ questionnaire.age }}
      </p>
      <p>
        <b-icon
          icon="arrow-right-drop-circle-outline"
          size="is-small"
        />
        内容：{{ questionnaire.text }}
      </p>
    </div>
    <vue-poll
      v-bind="options"
      final-results
    />
    <p>
      <router-link
        :to="`/questionnaire_list/${questionnaire.id}`"
        class="button"
      >
        Twitterでシェアする　<b-icon
          icon="menu-right"
          size="is-medium"
        />
      </router-link>
      <b-button
        type="is-text"
        @click="deleteQuestionnaire(questionnaire.id)"
      >
        削除
      </b-button>
    </p>
  </div>
</template>

<script>
import axios from "../../../plugins/axios";
import { mapGetters } from "vuex";
export default {
  name: "MyQuestionnaireItem",
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
    };
  },
  computed: {
    ...mapGetters("users", ["authUser"]),
  },
  methods: {
    deleteQuestionnaire(id) {
      if (
        confirm(
          "アンケートを削除してもよろしいでしょうか？一度削除すると、元には戻せません。"
        )
      )
        this.$axios
          .delete("/v1/questionnaires/" + id, {
            data: { id: this.questionnaire.id },
          })
          .then((res) => {
            this.$toasted.show("アンケートを削除しました。");
            this.$emit("after-delete");
          });
    },
  },
};
</script>

<style lang="scss">
.my-q-item {
  border-radius: 1rem;
  background-color: white;
  margin: 1rem;
  -webkit-transition: 0.3s;
  transition: 0.3s;
  border-radius: 1rem;
  background-color: white;
  border: 5px solid white;
}
.my-q-item:hover {
  border: 5px solid #ffd3d4;
}
@media screen and (max-width: 480px) {
  .my-q-item {
    margin: 1rem 0rem;
    width: 100%;
  }
  .section {
    padding: 1rem 0 !important;
    margin: 1rem auto;
  }
}
</style>
