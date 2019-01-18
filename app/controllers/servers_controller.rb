class ServersController < Sinatra::Base

  get '/servers' do
    "List to all servers"
  end

  get '/servers/new' do

  end

  get '/servers/:slug' do
    @server = Server.find_by_slug(params[:slug])
    erb :"servers/show"
  end



end
