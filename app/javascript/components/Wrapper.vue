<template>
  <div>
    <b-navbar variant="secondary">
      <b-navbar-nav>
        <b-nav-item to="/orders">Orders</b-nav-item>
        <b-nav-item to="/devices">Devices</b-nav-item>
        <b-nav-item>Enter A Reading</b-nav-item>
      </b-navbar-nav>
    </b-navbar>
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'Wrapper',
}
</script>

<!-- global styles -->
<style lang="stylus" scoped>
</style>
