class ServersController < ApplicationController


  get '/servers' do
     # binding.pry
    @servers = Server.all
    erb :"servers/all"
  end

  get '/servers/signup' do
    if  logged_in?
      redirect "/servers/#{current_user.slug}"
    else
    erb :'servers/new'
    end
  end

  post '/servers' do
    # binding.pry
    if Server.find_by(username: params["username"]) || Server.find_by(email: params["email"])
      erb :'servers/signup_warning'
    else
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty? && !params[:section].empty?
          @server = Server.new(:username => params[:username], :email => params[:email], :password => params[:password], :section_ids => params[:section])
          @server.save
          session[:server_id] = @server.id #login

          redirect "/servers/#{@server.slug}"
        else
          erb :'severs/new'
        end
    end
  end

  get '/servers/:slug' do
    if  logged_in?
    set_server
      if @server.id == current_user.id
        erb :"servers/show"
      else
        flash[:message] = "You can only show page your profile"
         redirect "/servers/#{current_user.slug}"
      end
    else
    redirect "/login"
    end
  end

  get '/servers/:slug/edit' do

    if logged_in?
         set_server
         if @server.id == current_user.id
            erb :"servers/edit_server"
         else
            flash[:message] = "You can only edit your profile"
            redirect "/servers/#{current_user.slug}"
         end
      else
         redirect "/login"
      end
  end

  patch '/servers/:slug' do
      # binding.pry
    set_server
    if logged_in?
      if @server.id == current_user.id
        @server.update(email: params[:email], username: params[:username], password: params[:password])
        redirect "/servers/#{@server.slug}"
      else
        redirect "/servers/#{@server.slug}"
      end
    else
      redirect "/login"
    end
   end

   delete '/servers/:slug' do
     set_server
     if logged_in?
       if @server.id == current_user.id
         @server.destroy
         redirect "/"
       else
          flash[:message] = "You can only delete your profile"
          redirect "/servers/#{@server.slug}"
       end
    else
       redirect "/"
    end
   end

  private
  def set_server
    @server = Server.find_by_slug(params[:slug])
  end

end
