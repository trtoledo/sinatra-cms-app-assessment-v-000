class SessionsController < ApplicationController
  get '/login' do
    if logged_in?
      redirect '/tweets'
    else
      erb :"/sessions/login"
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/tweets"
    else
      redirect "/login"
    end
  end

  get '/manager_login' do
    "Manager Login page"
  end


end
