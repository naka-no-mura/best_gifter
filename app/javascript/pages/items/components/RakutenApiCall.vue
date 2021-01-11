<template>
  <div>
    <b-field>
      <input class="text" type="text" placeholder="キーワードを入力する" @change="CHANGE_KEYWORD($event.target.value)" />
      <input class="submit" type="submit" value="検索" @click="SEARCH" />
    </b-field>
        <select v-model="selected">
            <option disabled value="">選択して下さい</option>
            <option v-for="genre in genres" :value="genre.genreId" :key="genre.id">
                {{ genre.genreName }}
            </option>
        </select>
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
