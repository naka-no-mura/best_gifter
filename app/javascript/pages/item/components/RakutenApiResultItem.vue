<template>
  <div class="column is-3">
  <div class="card">
    <div class="card-image">
      <figure class="image">
        <img :src="item.params.mediumImageUrls[0]" />
      </figure>
    </div>
    <div class="content">
      <p>{{ item.params.itemName }}</p>
      <span>{{ item.params.itemPrice }}</span>
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