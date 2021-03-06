class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "restaurantservermanagementtool"
    register Sinatra::Flash
  end

  get '/' do
    erb :"/index"
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Server.find_by(:id => session[:server_id]) if session[:server_id]
    end

    def logout!
      session.clear
    end

    def set_logged_server?
      @server == current_user
    end

    def redirect_if_not_allowed
      if !set_logged_server?
        flash[:message] = "You can only access your tips!"
        redirect "/tips/#{current_user.slug}/all"
      end

    end


    def set_server
      @server = Server.find_by_slug(params[:slug])
    end

  end


end
