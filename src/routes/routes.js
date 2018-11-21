import DashboardLayout from '@/pages/Layout/DashboardLayout.vue'

import Dashboard from '@/pages/Dashboard.vue'
import UserProfile from '@/pages/UserProfile.vue'
import Consultas from '@/pages/Consultas.vue'
import AtencionIntegral from '@/pages/AtencionIntegral.vue'
import AtencionTemprana from '@/pages/AtencionTemprana.vue'
import signin from '@/pages/signin.vue'

import AsignarCita from '@/pages/AsignarCita.vue'




const routes = [
  {
    path: '/',
    component: DashboardLayout,
    redirect: '/dashboard',
    children: [
      {
        path: 'dashboard',
        name: 'Inicio',
        component: Dashboard
      },
      {
        path: 'user',
        name: 'Registros de Usuarios',
        component: UserProfile
      },
      {
        path: 'Consultas',
        name: 'Consultas',
        component: Consultas
      },
      {
        path: 'AtencionIntegral',
        name: 'Atencion Integral',
        component: AtencionIntegral
      },
      {
        path: 'AtencionTemprana',
        name: 'Atencion Temprana',
        component: AtencionTemprana
      },
      {
        path: 'signin',
        name: 'sign in',
        component: signin
      },
     
      {
        path: 'AsignarCita',
        name: 'Asignar Cita',
        component: AsignarCita
      }    
    ]
  }
]

export default routes
