<template>
  <div class="wrapper" :class="{'nav-open': $sidebar.showSidebar}">
    <notifications></notifications>

    <side-bar>
      <mobile-menu slot="content"></mobile-menu>
      <sidebar-link to="/dashboard">
        <md-icon>home</md-icon>
        <p>Inicio</p>
      </sidebar-link>
      <sidebar-link to="/user">
        <md-icon>person</md-icon>
        <p>Gestionar Usuarios</p>
      </sidebar-link>
      <sidebar-link to="/AsignarCita">
        <md-icon>event_available </md-icon>
        <p>Asignar Cita</p>
      </sidebar-link>
      <sidebar-link to="/Consultas">
        <md-icon>find_in_page</md-icon>
        <p>Consultas</p>
      </sidebar-link>
      <sidebar-link to="/AtencionIntegral">
        <md-icon>library_books</md-icon>
        <p>Atención Integral </p>
      </sidebar-link>
      <sidebar-link to="/AtencionTemprana">
        <md-icon>event_note</md-icon>
        <p>Atención Temprana</p>
      </sidebar-link>
      <sidebar-link to="/Sing">
        <md-icon>meeting_room</md-icon>
        <p>Salir</p>
      </sidebar-link>
     
   
    </side-bar>

    <div class="main-panel">
      <top-navbar></top-navbar>

      <dashboard-content>

      </dashboard-content>

      <content-footer v-if="!$route.meta.hideFooter"></content-footer>
    </div>
  </div>
</template>
<style lang="scss">

</style>
<script>
import TopNavbar from './TopNavbar.vue'
import ContentFooter from './ContentFooter.vue'
import DashboardContent from './Content.vue'
import MobileMenu from '@/pages/Layout/MobileMenu.vue'

export default {
  components: {
    TopNavbar,
    DashboardContent,
    ContentFooter,
    MobileMenu
  }
}
</script>
