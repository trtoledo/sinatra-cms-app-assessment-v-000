class SessionsController < ApplicationController
  get '/login' do
    if logged_in?
      redirect "/servers/#{@server.slug}"
    else
      erb :"/sessions/login"
    end
  end

  post '/login' do
    # binding.pry
    @server = Server.find_by(:username => params[:username])
    if @server && @server.authenticate(params[:password])
      session[:server_id] = @server.id
      redirect "/servers/#{@server.slug}"
    else
      redirect "/login"
    end
  end

  get '/manager_login' do
    if logged_in?
      redirect '/'
    else
      erb :"/sessions/manager_login"
    end
  end

  post '/manager_login' do
    @manager = Manager.find_by(:username => params[:username])
    if @manager && @manager.authenticate(params[:password])
      session[:manager_id] = @manager.id
      redirect "/"
    else
      redirect "/manager_login"
    end
  end

  get '/logout' do
    if logged_in?
      logout!
      redirect '/'
    else
      redirect '/'
    end
  end






end
