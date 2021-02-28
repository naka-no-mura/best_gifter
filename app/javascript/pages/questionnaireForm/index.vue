<template>
<div class="container q-container">
  <QuestionnaireForm></QuestionnaireForm>
  </div>
</template>

<script>
import QuestionnaireForm from "./components/QuestionnaireForm.vue";

export default {
  name: "QuestionnaireFormIndex",
  components: {
    QuestionnaireForm,
  }
};
</script>

<style lang="scss">
.q-container {
  margin: 0 calc(50% - 50vw);
  background-color: rgba(255,249,255,1);
}
</style>