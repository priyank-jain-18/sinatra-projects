require 'sinatra'
require 'sinatra/reloader'
require_relative 'caesar_cipher/caesar_cipher.rb'
require_relative 'Hangman/Hang_Man.rb'

configure do
    enable :sessions
    set :session_secret, "secret"
end

get '/' do
    #@@session = session  
	erb:index
end

get '/caesar_cipher.html' do
    translation = nil	 
	erb:caesar_cipher, locals: {translation: translation}
end

post '/runcaesar' do
    session["translation"] = caesar_cipher(params["str"].to_s, params["vals"].to_i)
    erb:caesar_cipher, locals:{ translation: session["translation"]}
end

post '/caesar_but' do
    redirect 'caesar_cipher.html'
end

post '/hangman_but' do
    redirect 'hang_man.html'
end

post '/backMenu' do
	redirect '/'
end