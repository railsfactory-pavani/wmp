require 'sinatra'
require './roman1.rb'
require './numbers.rb'
require './spell_digit.rb'
require './kannada.rb'


get '/page' do 
date  =   params['date'].to_i
month = params['month'].to_i
year = params['year'].to_i
page = File.read('./form.html')
s = Roman.convert(year)
l = Numbers.convert(date)
n = Spell_digit.convert(year)
x = ""
if date !=0 && month !=0 && year !=0
t = Time.new(year,month,date)
x = t.strftime('%A')
end
a = Kannadacalendar.convert(x)
page =  page + ' ' + l + ' ' + month.to_s + ' ' + year.to_s + ' ' + n + ' ' + s + ' ' + x + ' ' + a.to_s # unless date.nil?
end

