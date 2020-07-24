<template>
  <div>
    <b-jumbotron header="Hello World from the Index.vue component" lead="Start customizing your site from here.">
      <p>Visit github.com/mikemaven for more info.</p>
    </b-jumbotron>
  </div>
</template>

<script>
export default {
  name: 'Index',

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
    // Invoked when the component loads, good place to fetch data from the API
  },
}
</script>

<style lang="stylus" scoped>
</style>
