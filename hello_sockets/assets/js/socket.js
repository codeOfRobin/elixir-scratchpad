import { Socket } from "phoenix"
const socket = new Socket("/socket", {})
socket.connect()

const channel = socket.channel("ping")
channel.join()
  .receive("ok", (resp) => { console.log("Joined ping", resp) })
  .receive("error", (resp) => { console.log("Unable to join ping", resp) })

console.log("send ping")
channel.push("ping")
  .receive("ok", (resp) => console.log("receive", resp.ping))

console.log("send pong")
channel.push("pong")
  .receive("ok", (resp) => console.log("won't happen"))
  .receive("error", (resp) => console.error("won't happen yet"))
  .receive("timeout", (resp) => console.error("pong message timeout", resp))

channel.push("invalid")
  .receive("ok", (resp) => console.log("won't happen"))
  .receive("error", (resp) => console.error("won't happen"))
  .receive("timeout", (resp) => console.error("invalid event timeout"))

const authSocket = new Socket("/auth_socket", {
  params: { token: window.authToken }
})
authSocket.onOpen(() => console.log('authSocket connected'))
authSocket.connect()

const recurringChannel = authSocket.channel("recurring")
recurringChannel.on("new_token", (payload) => {
  console.log("received new auth token", payload)
})
recurringChannel.join()

const dupeChannel = socket.channel("dupe")
dupeChannel.on("number", (payload) => {
  console.log("new number received", payload)
})

dupeChannel.join()

const statsSocket = new Socket("/stats_socket", {})
statsSocket.connect()
const statsChannelInvalid = statsSocket.channel("invalid")
statsChannelInvalid.join()
  .receive("error", () => statsChannelInvalid.leave())
const statsChannelValid = statsSocket.channel("valid")
statsChannelValid.join()
for (let i = 0; i < 5; i++) {
  statsChannelValid.push("ping")
}

export default socket