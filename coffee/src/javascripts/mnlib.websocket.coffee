class @Mnlib
  @ws = (url, protocols) ->
    new Mnlib.WebSocket(url, protocols)

class Mnlib.WebSocket
  socket = null

  @default_option =
    url: "ws://"

  constructor: (path, protocols) ->
    socket = new window.WebSocket("#{Mnlib.WebSocket.default_option.url}#{path}", protocols)
    window.onunload = ->
      socket.close(4500)

  url: (value) ->
    if value?
      socket.url = value
      return
    socket.url

  get: -> socket

  extensions: -> socket.extensions

  binaryType: -> socket.binaryType

  bufferedAmount: -> socket.bufferedAmount

  protocol: -> socket.protocol

  on: (action, ev) ->
    switch action
      when "open"
        socket.addEventListener("open", ev)
      when "close"
        socket.addEventListener("close", ev)
      when "message"
        socket.addEventListener("message", ev)
      when "error"
        socket.addEventListener("error", ev)

  send: (data) -> socket.send(JSON.stringify(data))

  emit: (event, data) ->
    data = {} unless data?
    data["event"] = event
    @send(data)

  close: (code, reason) -> socket.close(code, reason)

  dispatchEvent: (ev) -> socket.dispatchEvent(ev)

  isOpen: -> socket.readyState == WebSocket.OPEN

  isConnecting: -> socket.readyState == WebSocket.CONNECTING

  isClosed: -> socket.readyState == WebSocket.CLOSED

  isClosing: -> socket.readyState == WebSocket.CLOSING
