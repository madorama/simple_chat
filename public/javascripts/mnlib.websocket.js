(function() {
  this.Mnlib = (function() {
    function Mnlib() {}

    Mnlib.ws = function(url, protocols) {
      return new Mnlib.WebSocket(url, protocols);
    };

    return Mnlib;

  })();

  Mnlib.WebSocket = (function() {
    var socket;

    socket = null;

    WebSocket.default_option = {
      url: "ws://"
    };

    function WebSocket(path, protocols) {
      socket = new window.WebSocket("" + Mnlib.WebSocket.default_option.url + path, protocols);
      window.onunload = function() {
        return socket.close(4500);
      };
    }

    WebSocket.prototype.url = function(value) {
      if (value != null) {
        socket.url = value;
        return;
      }
      return socket.url;
    };

    WebSocket.prototype.get = function() {
      return socket;
    };

    WebSocket.prototype.extensions = function() {
      return socket.extensions;
    };

    WebSocket.prototype.binaryType = function() {
      return socket.binaryType;
    };

    WebSocket.prototype.bufferedAmount = function() {
      return socket.bufferedAmount;
    };

    WebSocket.prototype.protocol = function() {
      return socket.protocol;
    };

    WebSocket.prototype.on = function(action, ev) {
      switch (action) {
        case "open":
          return socket.addEventListener("open", ev);
        case "close":
          return socket.addEventListener("close", ev);
        case "message":
          return socket.addEventListener("message", ev);
        case "error":
          return socket.addEventListener("error", ev);
      }
    };

    WebSocket.prototype.send = function(data) {
      return socket.send(JSON.stringify(data));
    };

    WebSocket.prototype.emit = function(event, data) {
      if (data == null) {
        data = {};
      }
      data["event"] = event;
      return this.send(data);
    };

    WebSocket.prototype.close = function(code, reason) {
      return socket.close(code, reason);
    };

    WebSocket.prototype.dispatchEvent = function(ev) {
      return socket.dispatchEvent(ev);
    };

    WebSocket.prototype.isOpen = function() {
      return socket.readyState === WebSocket.OPEN;
    };

    WebSocket.prototype.isConnecting = function() {
      return socket.readyState === WebSocket.CONNECTING;
    };

    WebSocket.prototype.isClosed = function() {
      return socket.readyState === WebSocket.CLOSED;
    };

    WebSocket.prototype.isClosing = function() {
      return socket.readyState === WebSocket.CLOSING;
    };

    return WebSocket;

  })();

}).call(this);
