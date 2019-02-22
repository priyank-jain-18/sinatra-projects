require 'sinatra'
require 'sinatra/reloader'
require_relative 'caesar_cipher/caesar_cipher.rb'
require_relative 'Hangman/Hang_Man.rb'

get '/' do
    #@@session = session  
	erb:index
end