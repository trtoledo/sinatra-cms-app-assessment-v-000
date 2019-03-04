class TablesController < ApplicationController
  get '/tables/:id' do
    if  logged_in? 
      # @server = Server.find_by_slug(params[:slug])
    @table = Table.find_by(:id => params[:id])
    erb :"tables/show"
    else
    redirect "/login"
    end
  end

end
