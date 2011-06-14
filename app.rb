require 'rubygems'
require 'sinatra'

Rack::Mime::MIME_TYPES.merge!({
  ".manifest"     => "text/cache-manifest"
})
  
get '/' do
  redirect '/index.html'
end

not_found do
  begin
    File.read(File.join('public', '404.html'))  
  rescue
    'This is nowhere to be found'
  end
end

error 400..510 do
  begin
    File.read(File.join('public', '500.html'))
  rescue    
    'Boom'
  end
end