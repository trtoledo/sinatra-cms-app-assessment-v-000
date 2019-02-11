class ManagersController < ApplicationController
  get '/managers' do
    "List to all managers" 
  end

  get '/managers/new' do

  end

  get '/managers/:slug' do
    @manager = Manager.find_by_slug(params[:slug])
    erb :"managers/show"
  end

end
