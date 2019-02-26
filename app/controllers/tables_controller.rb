class TablesController < ApplicationController
  get '/tables/:id' do
    if  logged_in?
    @table = Table.find_by(:id => params[:id])
  
    erb :"tables/show"
    else
    redirect "/login"
    end
  end

end
