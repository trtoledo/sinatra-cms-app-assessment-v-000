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
    if !params[:amount].empty? && !params[:table_number].empty?
      @tip = Tip.new(:amount => params[:amount], :table_id => params[:table_number], :server_id => current_user.id)
      @tip.save
            # binding.pry
          redirect "/tips/#{current_user.slug}/all"
        else
          flash[:message] = "You must to input the Amount and the Table Number to insert your tips!"
          erb :'tips/new'
        end
   end

  get '/tips/:slug/all' do
    if  logged_in?
    set_server
      if set_logged_server?
        # binding.pry
        erb :"tips/show"
      else
        flash[:message] = "You can only access your tips!"
         redirect "/tips/#{current_user.slug}/all"
      end
    else
      flash[:message] = "You must login to access your page!"
    redirect "/login"
    end
  end

  get '/tips/:id/edit' do
    if logged_in?
      set_tip_with_id
      set_server_with_server_id
      # set_server
      # binding.pry
      # @tip = Tip.find_by(:server_id => @server.id)
      if set_logged_server?
        # binding.pry
        erb :"tips/edit_tip"
      else
        flash[:message] = "You can only edit your tips!"
        redirect "/tips/#{current_user.slug}/all"
      end
    else
      redirect "/login"
    end
  end

  patch '/tips/:id' do
    set_tip_with_id
    set_server_with_server_id
    if logged_in?
      if set_logged_server?
        @tip.update(amount: params[:amount], table_id: params[:table_number], server_id: @server.id )
        redirect "/tips/#{@server.slug}/all"
      else
        redirect "/tips/#{current_user.slug}/all"
      end
    else
      redirect "/login"
    end
  end

  delete '/tips/:id' do
    set_tip_with_id
    set_server_with_server_id
    if logged_in?
      if set_logged_server?
        @tip.destroy
        redirect "/tips/#{@server.slug}/all"
      else
         flash[:message] = "You can only delete your own tip!"
         redirect "/tips/#{current_user.slug}/all"
      end
   else
      redirect "/login"
   end
  end

  private
  def set_tip_with_id
    @tip = Tip.find(params[:id])
  end

  def set_server_with_server_id
    @server = Server.find_by(:id => @tip.server_id)
  end


end
