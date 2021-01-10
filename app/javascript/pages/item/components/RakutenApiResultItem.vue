<template>
  <div class="column is-3">
  <div class="card">
    <div class="card-image">
      <figure class="image">
        <img :src="item.Item.mediumImageUrls[0].imageUrl"/>
      </figure>
    </div>
    <div class="content">
      <p>{{ item.Item.itemName }}</p>
      <span>{{ item.Item.itemPrice }}</span>
    </div>
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