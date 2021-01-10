<template>
  <div>
    <b-field>
      <input class="text" type="text" placeholder="キーワードを入力する" @change="CHANGE_KEYWORD($event.target.value)" />
      <input class="submit" type="submit" value="検索" @click="SEARCH" />
    </b-field>
    <b-field label="Simple">
      <b-select placeholder="Select a name">
        <option
          v-for="option in genre"
          :value="option.id"
          :key="option.id">
          {{ option.user.first_name }}
        </option>
      </b-select>
    </b-field>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import { CHANGE_KEYWORD, SEARCH } from '../../../store/mutation-types'
export default {
  name: 'RakutenApiCall',
  methods: {
    ...mapActions([
      CHANGE_KEYWORD, SEARCH
    ])
  }
}
</script>

<style scope>

</style>
