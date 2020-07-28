import axios from 'axios'

export const actions = {
  loadDevices(context) {
    return new Promise((resolve) => {
      if (context.loaded) {
        resolve()
      }
      else {
        axios.get('/api/devices').then((response) =>{
          context.commit('setDevices', response.data)
        })
      }
    })
  },

  loadOrders(context) {
    return new Promise((resolve) => {
      if (context.loaded) {
        resolve()
      }
      else {
        axios.get('/api/orders').then((response) =>{
          context.commit('setOrders', response.data)
        })
      }
    })
  },

  shipOrder(context, orderId) {
    return new Promise((resolve) => {
      if (context.loaded) {
        resolve()
      }
      else {
        axios.patch(`/api/orders/${orderId}`, {status: "fulfilled"}).then((response) =>{
          context.commit('setOrders', response.data)
        })
      }
    })
  },

  deliverOrder(context, orderId) {
    return new Promise((resolve) => {
      if (context.loaded) {
        resolve()
      }
      else {
        axios.patch(`/api/orders/${orderId}`, {status: "delivered"}).then((response) =>{
          context.commit('setOrders', response.data)
        })
      }
    })
  }
}