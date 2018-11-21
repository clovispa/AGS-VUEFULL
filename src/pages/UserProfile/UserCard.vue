<template>
  <md-card class="md-card-profile">
    <div class="md-card-avatar">
       <img class="img" :src="cardUserImage">
    </div>

    <md-card-content>
      <h6 class="category text-gray">Noviembre 2018</h6>
      <h4 class="card-title">Citas disponibles</h4>
      <p class="card-description">
          Lunes  
      </p>
      <md-button class="md-round md-primary">Asignar</md-button>
    </md-card-content>
  </md-card>
</template>
<script>
export default {
  name: 'user-card',
  props: {
    cardUserImage: {
      type: String,
      default: require('@/assets/img/faces/descarga.jpg')
    }
  },
  data () {
    return {
    }
  }
}

</script>
<style>

</style>
