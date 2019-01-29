class ServersController < ApplicationController

  get '/servers' do
    "List to all servers"
  end

  get '/servers/new' do

  end

  get '/servers/:slug' do
    @server = Server.find_by_slug(params[:slug])
    erb :"servers/show"
  end

  # get '/login' do
  #   if logged_in?
  #     redirect '/tweets'
  #   else
  #     erb :"/sessions/login"
  #   end
  # end
  #
  # post '/login' do
  #   @server = Server.find_by(:username => params[:username])
  #   if @server && @server.authenticate(params[:password])
  #     session[:server_id] = @server.id
  #     redirect "/servers/:slug"
  #   else
  #     redirect "/login"
  #   end
  # end

  get '/logout' do
    if logged_in?
      logout!
      redirect '/login'
    else
      redirect '/login'
    end
  end



end
