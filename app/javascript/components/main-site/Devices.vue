<template>
  <div>
    <b-jumbotron header="Devices" lead="These are the devices currently registered for Good Measures">
      <p>Visit github.com/mikemaven for more info.</p>
    </b-jumbotron>
    <span v-for="device in devices">
      <device-card :device="device"/>
    </span>
  </div>
</template>

<script>
import DeviceCard from './DeviceCard.vue'

export default {
  name: 'Devices',

  components: {DeviceCard},

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
      form: {
        
      }
    }
  },

  computed: {
    devices(){
      return this.$store.getters.devices
    }
  },

  methods: {
    onSubmitMeasurement(event, deviceId){
      event.preventDefault();
      alert(JSON.stringify(this.form))
    }
  },

  mounted() {
    this.$store.dispatch('loadDevices')
  },
}
</script>

<style lang="stylus" scoped>
</style>
