(function() {
  var socket;

  Mnlib.WebSocket.default_option.url = "ws://" + location.host + "/websocket/";

  socket = Mnlib.ws("chat");

  socket.on("open", function() {
    return socket.emit("open");
  });

  socket.on("message", function(json) {
    var data, log;
    data = JSON.parse(json.data);
    log = $(".chat-log", "#chat-log-base").clone();
    log.find(".name").text(data.name);
    log.find(".message").html(data.message);
    log.find(".time").text(data.time);
    return $("#chat-logs").prepend(log);
  });

  $("#chat-send").on("click", function() {
    var message, name;
    name = $("#chat-name").val();
    message = $("#chat-message").val();
    return socket.emit("send", {
      name: name,
      message: message
    });
  });

}).call(this);
