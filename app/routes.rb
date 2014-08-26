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

get '/fb/:name/:say' do
  content_type 'text/html'
  <<-eos
  <html>
    <body>
      <img style="padding-left:30px" src="#{request.scheme}://#{request.host}/#{params[:name]}/#{params[:say]}?format=png" />
    </body>
  </html>
  eos
end

def convert (string, params)
  format = params[:format]
  if format
    if %w'jpg gif png'.include?(format)

      content_type "image/#{format}"
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
