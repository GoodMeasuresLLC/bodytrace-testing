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
          imei: data.imei,
          ts: new Date().getTime(),
          batteryVoltage: data.batteryVoltage,
          signalStrength: data.signalStrength,
          deviceId: data.imei,
          rssi: data.signalStrength,
          values: data.values
        }

        const headers = {
          'Content-Type': 'application/json'
        }

        axios.post('/api/devices/send_measurement', data_for_api, {headers: headers}).then(response =>{
          resolve(response);
        })
      }
    })
  },
  queueMeasurement(context, data) {
    return new Promise((resolve) => {
      if (context.loaded) {
        resolve()
      }
      else {
        const headers = {
          'Content-Type': 'application/json'
        }

        axios.post('/api/devices/queue_measurement', data, {headers: headers}).then(response =>{
          resolve(response);
        })
      }
    })
  }
}
