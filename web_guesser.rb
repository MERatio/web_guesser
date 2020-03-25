# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

random_number = rand(101)

get '/' do
  "The SECRET NUMBER IS #{random_number}"
end
