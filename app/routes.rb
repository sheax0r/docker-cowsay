$:.unshift(File.dirname(__FILE__))
require 'cow'
require 'sinatra'

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
  cow ? cow.say(params[:say]) : halt(404, "No such cow: #{params[:name]}")
end
