users = []

def broadcast2(users, sym, data)
  users.each {|user|
    send_message sym, user[:websocket_user], data
  }
end

SimpleChat::App.controller :websocket do
  sym = :chat

  websocket sym do
    on :open do |json|
      users << session
    end

    on :send do |json|
      json["message"] = escape_html(json["message"]).gsub("\n", "<br/>")
      time = Time.now.strftime("%Y/%m/%d %H:%M:%S")
      broadcast2 users, sym, {
        "name": json["name"],
        "message": json["message"],
        "time": time
      }
    end

    on :close do |json|
      users.delete session
    end

    def on_shutdown(e)
    end
  end
end
