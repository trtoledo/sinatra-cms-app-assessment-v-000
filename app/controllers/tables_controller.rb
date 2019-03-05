class TablesController < ApplicationController
  get '/tables/:id' do
    # binding.pry
    if  logged_in?
    @table = Table.find_by(:id => params[:id])
    @server = @table.server
      if @server.id == current_user.id
    erb :"tables/show"
      else
        redirect "/servers/#{current_user.slug}"
      end
    else
    redirect "/login"
    end
  end

end
