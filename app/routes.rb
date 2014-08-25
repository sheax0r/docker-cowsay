$:.unshift(File.dirname(__FILE__))
require 'cow'
require 'sinatra'
require 'shellwords'

set :bind, ENV.fetch('ADDRESS', '0.0.0.0')

before do
  content_type 'text/plain'
end

get '/' do
  "".tap do |str|
    Cow.all.each{|c| str << "#{c.name}\n"}
  end
end

get '/:name/:say' do
  cow = Cow.get(params[:name])
  convert(cow ? cow.say(params[:say]) : halt(404, "No such cow: #{params[:name]}"), params)
end

def convert (string, params)
  format = params[:format]
  if format
    if %w'jpg gif png'.include?(format)

      content_type "image/#{format}"
      puts "params: #{params}"
      puts "CMD: convert #{dimensions(params)} label:"#{Shellwords.escape(string)}" #{format}:-"
      `convert #{dimensions(params)} label:"#{Shellwords.escape(string)}" #{format}:-`
    end
  else
    string
  end
end

def dimensions(params)
  x = params[:x].nil? ? 320 : params[:x]
  y = params[:y].nil? ? 240 : params[:y]
  "-size #{x}x#{y}"
end
