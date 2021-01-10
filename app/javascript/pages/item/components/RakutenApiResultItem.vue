<template>
  <div class="card">
    <div class="content">
      <p>{{ item.Item.itemName }}</p>
      <span>{{ item.Item.itemPrice }}</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "RakutenApiResultItem",
  props: {
    item: Object,
    required: true
  }
}
</script>