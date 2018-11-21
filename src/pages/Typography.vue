<template>
  <div class="content">
    <div class="md-layout">
      <div class="md-layout-item">
        <md-card>
          <md-card-header data-background-color="blue">
            <h4 class="title">FORMATO LISTA DE PRE-ADMISIONES</h4>
       
          </md-card-header>
          <md-card-content>
            <div id="typography">
             
               <div class="row">
                    <md-card-content>
                        <div class="md-layout">
                         <div class="md-layout-item md-small-size-100 md-size-70">
                              <h4 class="title"><center><b>1. Datos Diligenciados Por Admisiòn y Gestiòn Social </b></center></h4>
                            </div>

                            <div>
                                   <div class="md-layout-item md-small-size-100 md-size-50">
                              
                            </div>
                                 <div class="md-layout-item md-small-size-100 md-size-43">
                                 <md-datepicker v-model="selectedDate">
                                <label>Fecha de la atención</label>
                                </md-datepicker>
                            </div>
                           
                               
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Primer Apellido</label>
                                <md-input v-model="username" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Segundo Apellido</label>
                                <md-input v-model="username" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Nombre </label>
                                <md-input v-model="username" type="text"></md-input>
                                </md-field>
                            </div>
                            <div>
                                <md-datepicker v-model="selectedDate">
                                <label>Fecha de Nacimiento</label>
                                </md-datepicker>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-15">
                                <md-field>
                                <label>Edad</label>
                                <md-input v-model="username" type="text"></md-input>
                                </md-field>
                            </div>
                                <div class="md-layout-item md-size-100">
                                    <md-field maxlength="5">
                                    <label>Diagnòstico Inicial informado por la familia</label>
                                    <md-textarea v-model="aboutme"></md-textarea>
                                    </md-field>
                            </div>
                                <div class="md-layout-item md-small-size-100 md-size-25">
                                    <md-field>
                                        <label for="salud">Vinculaciòn a salud</label>
                                        <md-select v-model="salud" name="salud" id="salud">
                                            <md-option value="fight-club">Si</md-option>
                                            <md-option value="godfather">No</md-option>
                                        
                                        </md-select>
                                    </md-field>
                                    </div>

                            <div class="md-layout-item md-small-size-100 md-size-25">
                                <md-field>
                                <label>Entidad de salud</label>
                                <md-input v-model="username" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-50">
                                <md-field>
                                <label>Persona que emite la informaciòn</label>
                                <md-input v-model="firstname" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-25">
                                <md-field>
                                <label>Parentesco</label>
                                <md-input v-model="lastname" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Dirección</label>
                                <md-input v-model="address" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-25">
                                <md-field>
                                <label>Telèfono</label>
                                <md-input v-model="city" type="text"></md-input>
                                </md-field>
                            </div>
                        
                            <div class="md-layout-item md-small-size-100 md-size-70">
                            <p class="category"><b>Situación de Familia</b></p>
                            </div>
                            
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Tipo</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Informaciòn laboral</label>
                                <md-input v-model="code" type="number"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Tenencia de vivienda</label>
                                <md-input v-model="code" type="number"></md-input>
                                </md-field>
                            </div>
                            
                            <div class="md-layout-item md-size-100">
                                <md-field maxlength="5">
                                <label>OBSERVACIONES GENERALES DE LA SITUACION DE FAMILIA</label>
                                <md-textarea v-model="aboutme"></md-textarea>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Monto asignado para evaluación</label>
                                <md-input v-model="code" type="number"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-50">
                              
                            </div>
                               
                             <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-datepicker v-model="selectedDate">
                                <label>Fecha evaluación</label>
                                </md-datepicker>
                            </div>
                             
                                  <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Hora de evaluación</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Tipo evaluación</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Remitido por </label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Antecedentes </label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>¿Necesidad de remitir a otra entidad Cual? </label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                             <div class="md-layout-item md-small-size-100 md-size-70">
                              <h4 class="title"><center><b>2. Datos para Diligenciar por Subcoordinadora de Terapias </b></center></h4>
                            </div>

                            <div class="md-layout-item md-small-size-100 md-size-45">
                                <md-datepicker v-model="selectedDate">
                                <label>Fecha de reprogramacion de la evaluacion (TS / PSIC)</label>
                                </md-datepicker>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Hora de Reprogramacion</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Asistencia/completa o incompleta</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Persona Responsable de la evaluacion</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                            <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Programa /perfil</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                                <div class="md-layout-item md-size-100">
                                <md-field maxlength="5">
                                <label>Diagnòstico Final</label>
                                <md-textarea v-model="aboutme"></md-textarea>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Estado</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Observación de la evaluaciòn</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Evaluador de psicologìa</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Evaluador de pedagogìa</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Programa /perfil</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Hora</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Programa /perfil</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-33">
                                <md-field>
                                <label>Hora</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>
                             <div class="md-layout-item md-small-size-100 md-size-70">
                              <h4 class="title"><center><b>3.Coordinación AGS </b></center></h4>
                            </div>
                              <div class="md-layout-item md-small-size-100 md-size-45">
                                <md-field>
                                <label>Tiempo transcurrido entre la evaluacion y devoluciòn</label>
                                <md-input v-model="country" type="text"></md-input>
                                </md-field>
                            </div>

                            <div class="md-layout-item md-size-100 text-right">
                                    <md-button class="md-raised md-success">Update Profile</md-button>
                                </div>
                          
                            
                        </div>

                    </md-card-content>        
               </div>
           </div>
          </md-card-content>
        </md-card>
      </div>
    </div>
  </div>
</template>

<script>
export default{
     
  props: {
    dataBackgroundColor: {
      type: String,
      selectedDate: null,
      default: ''
    }
  },
  name: 'LabeledDatepicker',

  data: () => ({
      selectedDate: null,
      textarea: null,
      salud: 'Si'
    })
  
}
</script>
