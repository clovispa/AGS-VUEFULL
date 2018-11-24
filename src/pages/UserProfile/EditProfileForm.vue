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
            <md-button class="md-raised md-primary">Guardar</md-button>
            <md-button class="md-raised md-primary" @click="sendData">Buscar</md-button>
            
              <ul>
                <li v-for=" u in usuari ">{{u.Nickname}}-{{u.Nombre}}-{{u.Apellido}}</li>
             </ul>
             <p></p>
             

            
          </div>
        </div>

      </md-card-content>
    </md-card>
  </form>
</template>
<script>
 import axios from "axios";

export default {
  name: 'Edit-Profile-Form',
  props: {
    dataBackgroundColor: {
      type: String,
      default: 'blue'
    }
  },
  data () {
    return {
      username: null,
        Nickname: "",
      usuari:[],
      ip: "",
      Nombre: "",
    
      Apellido: "",
      cargo:    null,
      emailadress: null,
      lastname: null,
      firstname: null,
      address: null,
      city: null,
      rol: null,
       boolean: false,
       response: ""
     
   
    }
  },
  computed:{
    searchmessage(){
      return `Usuarios encontrados: ${this.usuari.length}`
    }
  },
   mounted() {
         
        },
        methods: {
            sendData() {
                axios({ method: "GET", "url": "http://localhost:1337/api/prueba" }).then(result => {
                this.usuari = result.data.origin;
            }, error => {
                console.error(error);
            });
        }
  }
}

</script>
<style lang="scss" scoped>
 .md-switch {
    display: flex;
  }

  


</style>
