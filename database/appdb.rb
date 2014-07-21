require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'mysql2'
require_relative './lib/todolistfinal.rb'

client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "pavani")
configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

enable :sessions
set :session_secret, 'randomsecretkey112324'

# root page
get '/home' do
 
  erb :home
end
  
get '/add' do
 erb :add

end

post '/add' do
items = params["items"]
results = client.query("insert into todo(task,status) values('#{items}' , 'pending')")

erb :add
end

get '/pending' do

@items = client.query("select * from todo where status='pending'")

erb :pending
end

get '/completed' do


@completed_tasks = client.query("select * from todo where status='completed'")
erb :completed
end

get '/mark_done' do
 @items = client.query("select * from todo where status='pending'")
  erb :mark_done
end

post '/mark_done' do
 num = params['complete'].to_i
 results = client.query("update todo set status='completed' where ID='#{num}'")
 
 erb :mark_done
end

get '/delete' do
 @items = client.query("select * from todo where status='completed'")
 erb :delete
end

post '/delete' do
 num1 = params['delete'].to_i
 results = client.query("delete from todo where ID='#{num1}'")

 erb :delete
end

