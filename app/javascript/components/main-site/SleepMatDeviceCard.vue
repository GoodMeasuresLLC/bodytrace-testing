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
              id="sleep_score"
              label="Sleep score:"
              label-for="sleep_score"
            >
              <b-form-input
                id="sleep_score-input"
                v-model="form.sleep_score"
                type="number"
              ></b-form-input>
            </b-form-group>

            <b-form-group
              id="min_hr"
              label="Min HR:"
              label-for="min_hr"
            >
              <b-form-input
                id="min_hr-input"
                v-model="form.min_hr"
                type="number"
              ></b-form-input>
            </b-form-group>

            <b-form-group
              id="max_hr"
              label="Max HR:"
              label-for="max_hr"
            >
              <b-form-input
                id="max_hr-input"
                v-model="form.max_hr"
                type="number"
              ></b-form-input>
            </b-form-group>


            <b-form-group
              id="duration_in_sleep"
              label="Duration(hrs):"
              label-for="duration_in_sleep"
            >
              <b-form-input
                id="duration_in_sleep-input"
                v-model="form.duration_in_sleep"
                type="float"
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
  name: 'SleepMatDeviceCard',

  components: {},

  mixins: [],

  props: ['device'],

  data() {
    return {
      form: {
        sleep_score: 0,
        min_hr: 0,
        max_hr: 0,
        duration_in_sleep: 0.0,
      }
    }
  },


  methods: {
    onSubmitMeasurement(event){
      event.preventDefault();
      const paramDefaults = {
           "id": "578487143e61f90053e232e6",
           "device": "000BC1",
           "from": 1468279048,
           "to": 1468280582,
           "duration_in_bed": 24023,
           "avg_hr": 60.7,
           "avg_rr": 15.1,
           "avg_act": 105,
           "calc_data":
          "[[1468279048,null,null,75],[1468279050,68,null,100],[1468279052,66,null, 76],[1468279054,64,null,124]]",
           "sleep_score": 87,
           "duration_awake": 2490,
           "duration_in_sleep": 21540,
           "duration_in_rem": 5460,
           "duration_in_light": 11940,
           "duration_in_deep": 4140,
           "duration_sleep_onset": 1020,
           "sleep_data":
          "[[1468279063,4],[1468280053,2],[1468281043,1],[1468281793,2],[1468283293 ,1],[1468284223,2],[1468285063,3]]",
           "bedexit_count": 1,
           "bedexit_data": "[[1468279772,1468279379], [1468279772,1468279379]]",  "tossnturn_data":
          "[1468279784,1468281822,1468282296,1468284382,1468285504,1468289446,14682 90284,1468292376,1468297846]",
           "tossnturn_count": 24,
           "from_gmt_offset": 180,
           "min_hr": 51,
           "max_hr": 105,
           "min_rr": 8,
           "max_rr": 25,
           "fm_count": 2,
           "fm_data": "[1404720854,1404720986]",
           "user_id": 421,
           "awakenings": 2,
           "hrv_data": "[[40.4,31.2,-9.3,0.77,-1.40],[38.6,33.6,-5.0,0.87,- 0.76,235.4]]",
           "hrv_score": 43,
           "hrv_lf": 56,
           "hrv_hf": 44,
           "bedexit_duration": 0,
           "checked": 1,
           "duration": 24023,
           "hrv_rmssd_data":
          "[[1468279136,34,53,47],[1468279862,36,49,51],[1468280222,36,45,55],[1468 280582,36,42,58]]",
           "hrv_rmssd_evening": 40.4,
           "hrv_rmssd_morning": 31.2
      }


      let data =  {
        ...this.form,
        ...paramDefaults
      }

      data.sleep_score *=1
      data.duration_in_sleep /= 3600.0
      data.min_hr *=1
      data.max_hr *=1
      data.device = this.device.uuid

      this.$store.dispatch('queueMeasurement', data).then((response) => {
        this.clearForm();
      });
    },

    clearForm(){
      this.form.sleep_score = 0;
      this.form.duration_in_sleep = 0;
      this.form.min_hr = 0;
      this.form.max_hr = 0;
    }
  }
}
</script>

<style lang="stylus" scoped>
</style>
