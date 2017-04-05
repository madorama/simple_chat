module CompassInitializer
  def self.registered(app)
    require 'sass/plugin/rack'

    path = app.to_s.downcase.split("::")[1..-1].join("/")

    Compass.configuration do |config|
      config.project_path = Padrino.root
      config.project_type = :stand_alone
      config.output_style = :compressed
      config.sass_dir = "#{path}/stylesheets"
      if(path == "app")
        config.http_path = "/public"
        config.css_dir = "public/stylesheets"
        config.images_dir = "public/images"
        config.javascripts_dir = "public/javascripts"
      else
        config.http_path = "/public/#{path}"
        config.css_dir = "public/#{path}/stylesheets"
        config.images_dir = "public/#{path}/images"
        config.javascripts_dir = "public/#{path}/javascripts"
      end
    end

    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    app.use Sass::Plugin::Rack
  end
end
