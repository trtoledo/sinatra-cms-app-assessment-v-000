class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    ser :views, 'app/views'
    enable :sessions
    set :session_secret, "restaurantservermanagementtool"
  end

  get '/' do
    "Hello World!"
  end



end
