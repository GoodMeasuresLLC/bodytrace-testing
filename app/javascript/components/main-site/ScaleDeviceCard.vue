<template>
  <div>
    <b-card :title="'Device for order ' + device.order_id">
      <b-row v-if="device.status == 'ready'">
        <b-col align-self="start">
          <span class="text-secondary">Enter readings for the device associated with order {{device.order_id}}:</span>
        </b-col>
        <b-col align-self="end">
          <b-form @submit="onSubmitMeasurement">
            <b-form-group
              id="weight"
              label="Weight (In Pounds)"
              label-for="weight-input"
            >
              <b-form-input
                id="weight-input"
                v-model="form.values.weight"
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
  name: 'ScaleDeviceCard',

  components: {},

  mixins: [],

  props: ['device'],

  data() {
    return {
      form: {
        values: {
          weight: 0,
          unit: 1,
          tare: 300
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

      data.values.weight *= 454
      
      this.$store.dispatch('sendMeasurement', data).then((response) => {
        this.clearForm();
      });
    },

    clearForm(){
      this.form.values.weight = 0;
    }
  }
}
</script>

<style lang="stylus" scoped>
</style>
