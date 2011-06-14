require './app.rb'
run Sinatra::Application

Rack::Mime::MIME_TYPES.merge!({
  ".manifest"     => "text/cache-manifest"
})