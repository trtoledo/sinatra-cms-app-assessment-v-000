class ServersController < ApplicationController

  # get '/servers' do
  #   "List of all servers"
  # end

  get '/servers/signup' do
    # only managers can signup a server
    erb :'servers/new'
  end

  # post '/servers' do
  #   @server = Server.new
  #   @server.email = params[:email]
  #   @server.username = params[:username]
  #   @server.password = params[:password]
  #   if @server.save
  #     redirect '/login'
  #   else
  #     erb :'severs/new'
  #   end
  # end

  post '/servers' do
    # binding.pry
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      @server = Server.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @server.save
      session[:server_id] = @server.id #login

      redirect '/login'
    else
      erb :'severs/new'
    end
# binding.pry
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

  # get '/logout' do
  #   if logged_in?
  #     logout!
  #     redirect '/login'
  #   else
  #     redirect '/login'
  #   end
  # end



end
