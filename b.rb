require 'sinatra'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://b.db')

get '/:key' do
  if DB[:links].where(:key => params[:key]).first
    redirect to("http://#{ENV['DESTINATION_ROOT']}" + DB[:links].where(:key => params[:key]).first[:destination])
  else
    redirect to("http://#{ENV['DESTINATION_ROOT']}")
  end  
end

get '/' do
  redirect to("http://#{ENV['DESTINATION_ROOT']}")
end
