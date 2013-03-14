require 'sinatra'
require 'sinatra/reloader'
require 'sass'

get '/' do
	File.read 'public/index.html'
end

get '/stylesheets/*.css' do
  content_type 'text/css', :charset => 'utf-8'
  filename = params[:splat].first
  scss filename.to_sym, :views => "#{settings.root}/assets/stylesheets"
end

get '/javascripts/*.js' do
	content_type 'text/javascript', :charset => 'utf-8'
	filename = params[:splat].first
	File.read "#{settings.root}/assets/javascripts/#{filename}.js"
end
