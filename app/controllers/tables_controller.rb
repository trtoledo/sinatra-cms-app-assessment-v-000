class TablesController < ApplicationController
  get '/tables/:id' do
    # binding.pry
    if  logged_in?
      set_table
      set_table_server
      if set_logged_server?
    erb :"tables/show"
      else
        redirect "/servers/#{current_user.slug}"
      end
    else
      redirect "/login"
    end
  end

  private
  def set_table
    @table = Table.find_by(:id => params[:id])
  end

  def set_table_server
    @server = @table.server
  end

end
