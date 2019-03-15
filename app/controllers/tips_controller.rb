class TipsController < ApplicationController

  get '/tips' do
    if  logged_in?
    @tips = Tip.all
    erb :"tips/all"
    else
      flash[:message] = "You have to login to access the tips list!"
       redirect "/login"
    end

  end

  get '/tips/new' do
    if  logged_in?
        erb :"tips/new"
    else
      flash[:message] = "You have to login to insert your tips!"
    redirect "/login"
    end
  end

  post '/tips' do
    # if Tip.find_by(username: params["username"]) || Server.find_by(email: params["email"])
    #   flash[:message] = "You must to input the Amount and the Table Number to insert your tips!"
    #   erb :'tips/new'
    # else
        if !params[:amount].empty? && !params[:table_number].empty?
          @tip = Tip.new(:amount => params[:amount], :table_id => params[:table_number], :server_id => current_user.id)
          @tip.save
            # binding.pry

          redirect "/tips/#{current_user.slug}/all"
        else
          flash[:message] = "You must to input the Amount and the Table Number to insert your tips!"
          erb :'tips/new'
        end
    # end
  end

  get '/tips/:slug/all' do
    if  logged_in?
    set_server
      if set_logged_server?
        # binding.pry

        erb :"tips/show"
      else
        flash[:message] = "You can only access your profile!"
         redirect "/servers/#{current_user.slug}"
      end
    else
      flash[:message] = "You must login to access your page!"
    redirect "/login"
    end
  end

  get '/tips/:slug/edit' do

  end


end
