<template>
  <div>
    <template v-for="item in items">
      <div class="columns">
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