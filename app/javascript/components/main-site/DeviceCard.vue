<template>
  <div>
    <b-card :title="device.imei">
      <b-row>
        <b-col align-self="start">
          <span class="text-secondary">Enter readings for this device:</span>
        </b-col>
        <b-col align-self="end">
          <b-form @submit="onSubmitMeasurement">
            <b-form-group
              id="battery-voltage"
              label="Battery Voltage:"
              label-for="battery-voltage-input"
            >
              <b-form-input
                id="battery-voltage-input"
                v-model="form.batteryVoltage"
                type="number"
              ></b-form-input>
            </b-form-group>

            <b-form-group
              id="signal-strength"
              label="Signal Strength:"
              label-for="signal-strength-input"
            >
              <b-form-input
                id="signal-strength-input"
                v-model="form.signalStrength"
                type="number"
              ></b-form-input>
            </b-form-group>

            <b-form-group
              id="weight"
              label="Weight (In Grams)"
              label-for="weight-input"
            >
              <b-form-input
                id="weight-input"
                v-model="form.weight"
                type="number"
              ></b-form-input>
            </b-form-group>

            <b-button type="submit" variant="primary">Record Measurement</b-button>
          </b-form>
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
export default {
  name: 'DeviceCard',

  components: {},

  mixins: [],

  props: ['device'],

  data() {
    return {
      form: {
        batteryVoltage: 0,
        signalStrength: 0,
        weight: 0
      }
    }
  },


  methods: {
    onSubmitMeasurement(event){
      event.preventDefault();
      alert(JSON.stringify(this.form))
    }
  }
}
</script>

<style lang="stylus" scoped>
</style>
