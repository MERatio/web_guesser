# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

set :secret_number, rand(101)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess, settings.secret_number)
  erb :index, locals: { number: settings.secret_number, message: message }
end

def check_guess(guess, secret_number)
  if guess > secret_number
    high_guess(guess, secret_number)
  elsif guess < secret_number
    low_guess(guess, secret_number)
  else
    "You got it right! The SECRET NUMBER is #{secret_number}"
  end
end

def high_guess(guess, secret_number)
  if guess > secret_number + 5
    'Way too high!'
  else
    'Too high!'
  end
end

def low_guess(guess, secret_number)
  if guess < secret_number - 5
    'Way too low!'
  else
    'Too low!'
  end
end
