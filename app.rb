require 'rubygems'
require 'sinatra'

get '/cache.manifest' do
  # Must be served with this MIME type
  headers 'Content-Type' => 'text/cache-manifest' 
end

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