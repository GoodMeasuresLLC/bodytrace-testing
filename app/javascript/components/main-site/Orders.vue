<template>
  <div>
    <b-jumbotron header="Orders" lead="These are the orders currently pending shipping.">
      <p>Visit github.com/mikemaven for more info.</p>
    </b-jumbotron>
    <b-card :title="order.first_name + ' ' + order.last_name" v-for="order in orders">
      <b-row>
        <b-col align-self="start">
          Order ID: {{order.uuid}}
        </b-col>
        <b-col align-self="end">
          <b-button v-if="order.status == 'pending'" variant="success" @click="doShip(order.id)">Ship</b-button>
          <b-button v-if="order.status == 'fulfilled'" variant="danger" @click="doDeliver(order.id)">Deliver</b-button>
          <div v-if="order.status == 'delivered'">Delivered on {{order.updated_at}}</div> 
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
export default {
  name: 'Orders',

  components: {},

  mixins: [],

  props: {
    /*
    property: {
      type: String|Number|Boolean|Array|Object|Date|Function|Symbol,
      default: null,
      required: false
    },
    */
  },

  data() {
    return {
      // field: 'value'
    }
  },

  computed: {
    orders(){
      return this.$store.getters.orders
    }
  },

  methods: {
    doShip(orderId){
      this.$store.dispatch('shipOrder', orderId)
    },
    doDeliver(orderId){
      this.$store.dispatch('deliverOrder', orderId)
    }
  },

  mounted() {
    this.$store.dispatch('loadOrders')
  },
}
</script>

<style lang="stylus" scoped>
</style>
