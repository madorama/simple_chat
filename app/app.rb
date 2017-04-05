module SimpleChat
  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::WebSockets
    register CompassInitializer
    enable :sessions
  end
end
