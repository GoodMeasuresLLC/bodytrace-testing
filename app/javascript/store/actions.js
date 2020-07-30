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
  },

  sendMeasurement(context, data) {
    return new Promise((resolve) => {
      if (context.loaded) {
        resolve()
      }
      else {
        const data_for_api = {
          imei: data.device.imei,
          ts: new Date().getTime(),
          batteryVoltage: data.form.batteryVoltage,
          signalStrength: data.form.signalStrength,
          deviceId: data.device.imei,
          rssi: data.form.signalStrength,
          values: {
            unit: 1,
            tare: 300,
            weight: data.form.weight
          }
        }

        axios.post('http://localhost:3000/bodytrace/measurements', data_for_api).then((response) => {
          debugger
        })
      }
    })
  }
}