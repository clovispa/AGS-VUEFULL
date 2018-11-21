<template>
  <div class="content">
    <div class="md-layout">
      <div class="md-layout-item md-medium-size-100 md-size-66">
        <Editar-Asignar-Cita data-background-color="blue">

        </Editar-Asignar-Cita>
      </div>
      <div class="md-layout-item md-medium-size-100 md-size-33">
        <user-card>

        </user-card>
      </div>
    </div>
  </div>
</template>

<script>
import {
  EditarAsignarCita,
  UserCard
} from '@/pages'

export default{
  components: {
    EditarAsignarCita,
     UserCard  
  }
}
</script>
