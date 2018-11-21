<template>
  <div class="content">
    <div class="md-layout">
      
      
      
      <div class="md-layout-item md-medium-size-50 md-xsmall-size-100 md-size-25">
        <stats-card data-background-color="green">
          <template slot="header">
            <md-icon >store</md-icon>
          </template>

          <template slot="content">
            <p class="category">Ingresos</p>
            <h3 class="title">45</h3>
          </template>

          <template slot="footer">
            <div class="stats">
                <md-icon>date_range</md-icon>
                Año 2018
            </div>
          </template>
        </stats-card>
      </div>
      <div class="md-layout-item md-medium-size-50 md-xsmall-size-100 md-size-25">
        <stats-card data-background-color="orange">
          <template slot="header">
            <md-icon >event_available</md-icon>
          </template>

          <template slot="content">
            <p class="category">Ingresos</p>
            <h3 class="title">4
               
            </h3>
          </template>

          <template slot="footer">
            <div class="stats">
              <md-icon >date_range</md-icon>       
               Noviembre
            </div>
          </template>
        </stats-card>
      </div>
      <div class="md-layout-item md-medium-size-50 md-xsmall-size-100 md-size-25">
        <stats-card data-background-color="red">
          <template  slot="header">
            <md-icon >warning</md-icon>
          </template>

          <template slot="content">
            <p class="category">En Espera</p>
            <h3 class="title">15</h3>
          </template>

          <template slot="footer">
            <div class="stats">
               <md-icon>date_range</md-icon>
               Año 2018
            </div>
          </template>
        </stats-card>
      </div>
      <div class="md-layout-item md-medium-size-50 md-xsmall-size-100 md-size-25">
        <stats-card data-background-color="blue">
          <template  slot="header">
               <md-icon >folder_special</md-icon>
          </template>

          <template slot="content">
            <p class="category">Atendidos</p>
            <h3 class="title">120</h3>
          </template>

          <template slot="footer">
            <div class="stats">
               <md-icon>update</md-icon>
               Año 2018
            </div>
          </template>
        </stats-card>
      </div>
   
  
    </div>
  </div>
</template>

<script>
import {
  StatsCard,
  ChartCard,
  NavTabsCard,
  NavTabsTable,
  OrderedTable
} from '@/components'

export default{
  components: {
    StatsCard,
    ChartCard,
    NavTabsCard,
    NavTabsTable,
    OrderedTable
  },
  data () {
    return {
   
 
    }
  }
}
</script>
