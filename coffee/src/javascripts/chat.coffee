Mnlib.WebSocket.default_option.url = "ws://#{location.host}/websocket/"

socket = Mnlib.ws("chat")

socket.on "open", ->
  socket.emit "open"

socket.on "message", (json) ->
  data = JSON.parse(json.data)
  log = $(".chat-log", "#chat-log-base").clone()
  log.find(".name").text(data.name)
  log.find(".message").html(data.message)
  log.find(".time").text(data.time)
  $("#chat-logs").prepend(log)

$("#chat-send").on "click", ->
  name = $("#chat-name").val()
  message = $("#chat-message").val()
  socket.emit "send", {
    name: name
    message: message
  }
 
