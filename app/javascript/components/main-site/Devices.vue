<template>
  <div>
    <b-jumbotron header="Devices" lead="These are the devices currently registered for Good Measures">
      <p>Visit github.com/goodmeasuresllc for more info.</p>
    </b-jumbotron>
    <span v-for="device in devices" :key="device.id">
      <scale-device-card v-if="device.device_type == 'scale'" :device="device"/>
      <bp-cuff-device-card v-if="device.device_type == 'bp_cuff'" :device="device"/>
      <sleep-mat-device-card v-if="device.device_type == 'sleep_mat'" :device="device"/>
    </span>
  </div>
</template>

<script>
import ScaleDeviceCard from './ScaleDeviceCard.vue'
import BpCuffDeviceCard from './BpCuffDeviceCard.vue'
import SleepMatDeviceCard from './SleepMatDeviceCard.vue'

export default {
  name: 'Devices',

  components: {ScaleDeviceCard, BpCuffDeviceCard, SleepMatDeviceCard},

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
