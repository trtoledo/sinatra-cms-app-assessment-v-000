class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "restaurantservermanagementtool"
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

    # def self.username_already_exists?
    #   Server.find_by(username: params["username"])
    # end
    #
    # def self.email_already_exists?
    #   Server.find_by(email: params["email"])
    # end

  end


end
