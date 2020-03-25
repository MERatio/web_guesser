# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'

$guesses = 5

set :secret_number, rand(101)

get '/' do
  guess = params[:guess].to_i
  $guesses -= 1 if params[:guess]
  evaluation = check_guess(guess, settings.secret_number)
  message = evaluation[:message]
  bg_color = evaluation[:bg_color]

  if $guesses.zero? && guess != settings.secret_number
    message = 'You lost, no guesses left, a new number game is created.'
    bg_color = '#fff'
    reset_game
  end

  erb :index, locals: { number: settings.secret_number,
                        message: message,
                        bg_color: bg_color }
end

def reset_game
  $guesses = 5
  settings.secret_number = rand(101)
end

def check_guess(guess, secret_number)
  if params[:guess].nil?
    { message: 'Guess the number, pick between 0 to 100.', bg_color: '#fff' }
  elsif guess > secret_number
    high_guess(guess, secret_number)
  elsif guess < secret_number
    low_guess(guess, secret_number)
  elsif guess == secret_number
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
  reset_game
  { message: "You got it right! The SECRET NUMBER is #{secret_number},
              a new game is created.",
    bg_color: '#4f4' }
end
