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
  }
}