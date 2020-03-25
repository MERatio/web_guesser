# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

set :secret_number, rand(101)

get '/' do
  guess = params[:guess].to_i
  evaluation = check_guess(guess, settings.secret_number)
  erb :index, locals: { number: settings.secret_number,
                        message: evaluation[:message],
                        bg_color: evaluation[:bg_color] }
end

def check_guess(guess, secret_number)
  if guess > secret_number
    high_guess(guess, secret_number)
  elsif guess < secret_number
    low_guess(guess, secret_number)
  else
    correct_guess(secret_number)
  end
end

def high_guess(guess, secret_number)
  if guess > secret_number + 5
    { message: 'Way too high!', bg_color: '#f33' }
  else
    { message: 'Too high!', bg_color: '#f77' }
  end
end

def low_guess(guess, secret_number)
  if guess < secret_number - 5
    { message: 'Way too low!', bg_color: '#f33' }
  else
    { message: 'Too low!', bg_color: '#f33' }
  end
end

def correct_guess(secret_number)
  { message: "You got it right! The SECRET NUMBER is #{secret_number}",
    bg_color: '#4f4' }
end
