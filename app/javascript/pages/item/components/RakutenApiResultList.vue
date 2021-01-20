<template>
  <div class="columns is-multiline">
    <template v-for="item in items">
      <div class="column is-3">
        <RakutenApiResultItem :key="item.id" :item="item" />
      </div>
    </template>
  </div>
</template>

<script>
import RakutenApiResultItem from './RakutenApiResultItem'
export default {
  name: "RakutenApiResultList",
  components: {
    RakutenApiResultItem
  },
  props: {
    items: Array,
    required: true
  }
}
</script>

<style scope>
</style>