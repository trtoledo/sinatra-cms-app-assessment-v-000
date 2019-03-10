class SessionsController < ApplicationController
  get '/login' do
    if logged_in?
      redirect "/servers"
    else
      erb :"/sessions/login"
    end
  end

  post '/login' do
    @server = Server.find_by(:username => params[:username])
    if @server && @server.authenticate(params[:password])
      session[:server_id] = @server.id
      redirect "/servers/#{@server.slug}"
    else
      flash[:message] = "Your Username or your password are incorrect. Please try again."
      redirect "/login"
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
