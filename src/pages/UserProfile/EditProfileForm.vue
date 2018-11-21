<template>
  <form>
    <md-card>
      <md-card-header :data-background-color="dataBackgroundColor">
        <h4 class="title">Crear Nuevo Usuario</h4>
        <p class="category">Registre un Nuevo Usuario</p>
      </md-card-header>

      <md-card-content>
        <div class="md-layout">
          
          <div class="md-layout-item md-small-size-100 md-size-33">
            <md-field>
              <label>Nickname</label>
              <md-input v-model="nickname" type="text"></md-input>
            </md-field>
          </div>
          <div class="md-layout-item md-small-size-100 md-size-33">
            
          </div>
        
          <div class="md-layout-item md-small-size-100 md-size-33">
            
              
               <md-switch v-model="boolean" class="md-primary">Activar Usuario</md-switch>
           
          </div>
         
          <div class="md-layout-item md-small-size-100 md-size-50">
            <md-field>
              <label>Nombre</label>
              <md-input v-model="firstname" type="text"></md-input>
            </md-field>
          </div>´
            <div class="md-layout-item md-small-size-100 md-size-33">
            <md-field>
              <label>Apellido</label>
              <md-input v-model="apellido" type="text"></md-input>
            </md-field>
          </div>
          <div class="md-layout-item md-small-size-100 md-size-50">
            <md-field>
              <label>Cargo</label>
              <md-input v-model="cargo" type="text"></md-input>
            </md-field>
          </div>
          <div class="md-layout-item md-small-size-100 md-size-100">
            <md-field>
              <label>Correo Electrònico</label>
              <md-input v-model="address" type="text"></md-input>
            </md-field>
          </div>

            <div class="md-layout-item">
              <md-field>
                <label for="rol">Rol</label>
                <md-select v-model="rol" name="rol" id="rol" md-dense>
                  <md-option value="administrador">Administrador</md-option>
                  <md-option value="secretaria">Secretaria</md-option>
                  <md-option value="trabajadorasocial">Trabajadora Social</md-option>
                  <md-option value="psicologa">Psicòlogo</md-option>
                </md-select>
              </md-field>
         </div>
         
         
          <div class="md-layout-item md-size-100 text-right">
            <md-button class="md-raised md-success">Guardar</md-button>
          </div>
        </div>

      </md-card-content>
    </md-card>
  </form>
</template>
<script>
export default {
  name: '',
  props: {
    dataBackgroundColor: {
      type: String,
      default: ''
    }
  },
  data () {
    return {
      username: null,
      nickname: null,
    
      apellido: null,
      cargo:    null,
      emailadress: null,
      lastname: null,
      firstname: null,
      address: null,
      city: null,
      rol: null,
       boolean: false
     
   
    }
  }
}

</script>
<style lang="scss" scoped>
 .md-switch {
    display: flex;
  }

  


</style>
