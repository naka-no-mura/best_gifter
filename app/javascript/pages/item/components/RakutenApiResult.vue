<template>
  <div>
    <div class="item-inner">
      <div class="content">
        <p>{{ item.Item.itemName }}</p>
      </div>
      <span>{{ item.Item.itemPrice }}</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "RakutenApiResult",
  props: {
    item: Array,
    required: true
  }
}
</script>