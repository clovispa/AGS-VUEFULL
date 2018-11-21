<template>
  <form>
    <md-card>
      <md-card-header :data-background-color="dataBackgroundColor">
        <h4 class="title"><b>Asignar Cita de evaluación inicial</b></h4>
        <p class="category"><b>Ingrese datos del estudiante</b></p>
      </md-card-header>

      <md-card-content>
        <div class="md-layout">
        
          <div class="md-layout-item md-small-size-100 md-size-33">
            <md-field>
              <label>Nombre del Acudiente</label>
              <md-input v-model="username" type="text"></md-input>
            </md-field>
          </div>
          <div class="md-layout-item md-small-size-100 md-size-33">
            <md-field>
              <label>Numero de Contàcto</label>
              <md-input v-model="emailadress" type="email"></md-input>
            </md-field>
          </div>
          <div class="md-layout-item md-small-size-100 md-size-50">
            <md-field>
              <label>Nombre del Estudiante</label>
              <md-input v-model="firstname" type="text"></md-input>
            </md-field>
          </div>
          <div class="md-layout-item md-small-size-100 md-size-50">
            <md-field>
              <label>Apellido del Estudiante</label>
              <md-input v-model="lastname" type="text"></md-input>
            </md-field>
          </div>
          <div class="md-layout-item md-small-size-100 md-size-100">
            <md-field>
              <label>Barrio</label>
              <md-input v-model="address" type="text"></md-input>
            </md-field>
          </div>
         
          
        
          <div class="md-layout-item md-size-100">
            <md-field maxlength="5">
              <label>Observaciones :</label>
              <md-textarea v-model="aboutme"></md-textarea>
            </md-field>
          </div>
          <div class="md-layout-item md-size-100 text-right">
            <md-button class="md-raised md-primary">Guaardar</md-button>
          </div>
        </div>

      </md-card-content>
    </md-card>
  </form>
</template>
<script>
export default {
  name: 'Editar-Asignar-Cita',
  props: {
    dataBackgroundColor: {
      type: String,
      default: 'blue'
    }
  },
  data () {
    return {
      username: null,
      disabled: null,
      emailadress: null,
      lastname: null,
      firstname: null,
      address: null,
      city: null,
      country: null,
      code: null,
      aboutme: "Escriba su texto aquí."
    }
  }
}

</script>
<style>

</style>
