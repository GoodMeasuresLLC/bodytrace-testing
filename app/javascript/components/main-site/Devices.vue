<template>
  <div>
    <b-jumbotron header="Devices" lead="These are the devices currently registered for Good Measures">
      <p>Visit github.com/mikemaven for more info.</p>
    </b-jumbotron>
  </div>
</template>

<script>
export default {
  name: 'Devices',

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
    // computed properties are cached based on their dependencies
    /*
    computedProperty() {
      return 'value'
    },
    */
  },

  methods: {
    // Methods run whenever a re-render happens, their results aren't cached.
    /*
    onClick() {
      this.$emit('click-happened')
    },
    */
  },

  mounted() {
    this.$store.dispatch('loadDevices')
  },
}
</script>

<style lang="stylus" scoped>
</style>
