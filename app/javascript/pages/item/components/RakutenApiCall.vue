<template>
  <div>
    <input class="text" type="text" @change="CHANGE_KEYWORD($event.target.value)" />
    <input class="submit" type="submit" value="検索" @click="SEARCH" />
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
// import axios from "axios"

// export default {
//   name: "RakutenApiCall",
//   data() {
//     return {
//       items:[]
//     }
//   },

  // methods:{
  //   async searchItem() {
  //     const response = this.$axios.get('https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706', {
  //       params: {
  //         applicationId: "1092280411653960373",
  //         keyword: '筋トレ',
  //         giftFlag: 1,
  //       }
  //     })
  //     .then(response => {
  //       this.items = response.data;
  //     })
  //     .catch(error => {
  //       console.log(error)
  //     });
  //   },
  // },
// };
</script>

<style scope>

</style>
