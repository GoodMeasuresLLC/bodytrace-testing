<template>
  <div>
    <b-card :title="'Device for order ' + device.order_id">
      <b-row v-if="device.status == 'ready'">
        <b-col align-self="start">
          <span class="text-secondary">Enter readings for this device:</span>
        </b-col>
        <b-col align-self="end">
          <b-form @submit="onSubmitMeasurement">
            <b-form-group
              id="systolic"
              label="Systolic:"
              label-for="systolic-input"
            >
              <b-form-input
                id="systolic-input"
                v-model="form.values.systolic"
                type="number"
              ></b-form-input>
            </b-form-group>

            <b-form-group
              id="diastolic"
              label="Diastolic:"
              label-for="diastolic-input"
            >
              <b-form-input
                id="diastolic-input"
                v-model="form.values.diastolic"
                type="number"
              ></b-form-input>
            </b-form-group>

            <b-form-group
              id="pulse"
              label="Pulse:"
              label-for="pulse-input"
            >
              <b-form-input
                id="pulse-input"
                v-model="form.values.pulse"
                type="number"
              ></b-form-input>
            </b-form-group>
            <b-button type="submit" variant="primary">Record Measurement</b-button>
          </b-form>
        </b-col>
      </b-row>
      <b-row v-else-if="device.status == 'shipping'">
        <b-col align-self="start">
          <span class="text-secondary">This device is currently shipping.</span>
        </b-col>
      </b-row>
      <b-row v-else>
        <b-col align-self="start">
          <span class="text-secondary">This device is pending shipping.</span>
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
export default {
  name: 'BpCuffDeviceCard',

  components: {},

  mixins: [],

  props: ['device'],

  data() {
    return {
      form: {
        values: {
          systolic: 0,
          diastolic: 0,
          pulse: 0,
          unit: 1,
          irregular: 0
        }
      }
    }
  },


  methods: {
    onSubmitMeasurement(event){
      event.preventDefault();
      const paramDefaults = {
        batteryVoltage: 5801,
        signalStrength: 80
      }

      let data =  {
        ...this.form,
        ...this.device,
        ...paramDefaults
      }

      data.values.systolic *= 133
      data.values.diastolic *= 133
      data.values.pulse *=1

      this.$store.dispatch('sendMeasurement', data).then((response) => {
        this.clearForm();
      });
    },

    clearForm(){
      this.form.values.systolic = 0;
      this.form.values.diastolic = 0;
      this.form.values.pulse = 0;
    }
  }
}
</script>

<style lang="stylus" scoped>
</style>
