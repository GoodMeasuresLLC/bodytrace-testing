<template>
  <div>
    <b-jumbotron header="Hello World!" lead="This is the GoodMeasures/Bodytrace testing application.">
      <p>Visit www.goodmeasures.com for more info.</p>
    </b-jumbotron>
    <h3>How to Test From Our Application</h3>

    <p>First, you must be logged in as a coach and on the dashboard for a test patient whose organization is enabled for both scales and BP cuffs - I have been using Onduo Walgreens Healthy Weight. Scale and BP cuff info are under the “Account” tab of the top right card group.</p>
    
    <p>Find a patient who does not yet have an associated scale or BP cuff. Click “order scale” or “order BP cuff” to simulate ordering the device. Back in the testing application, you should refresh the Orders page and see the order show up. </p>
    
    <p>Refresh the coach dashboard and see that next to the type of device you’ve ordered, there should now be a clickable link that says “ordered”. Clicking the link will give you the initial order information.</p>
    
    <p>Back in the testing application, clicking “Ship” and “Deliver” will update the shipping status, send over a fake tracking number, etc and those updates can be seen back on the coach dashboard by clicking on the “ordered” link again.
    Once the order has been marked as “Delivered”, it’s associated device will be able to send measurements from the Devices page. When sending a measurement, the patient’s weight and blood pressure readings should be updated, and the latest reading should also be displayed when clicking the “ordered” link from the Account tab.</p>
  </div>
</template>

<script>
export default {
  name: 'Index',

  components: {},

  mixins: [],

  props: {

  },

  data() {
    return {
      
    }
  }
}
</script>

<style lang="stylus" scoped>
</style>
