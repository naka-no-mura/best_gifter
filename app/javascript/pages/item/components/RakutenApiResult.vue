<template>
  <div>
    <template v-for="item in items">
      <RakutenApiResultItem :key="item.id" :item="item" />
    </template>
  </div>
</template>

<script>
import RakutenApiResultItem from './RakutenApiResultItem'
export default {
  name: "RakutenApiResult",
  components: {
    RakutenApiResultItem
  },
  props: {
    items: Array,
    required: true
  }
}
</script>