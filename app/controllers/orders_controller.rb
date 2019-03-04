class OrdersController < ApplicationController
  get '/orders/new' do
    
    erb :'orders/new'
  end

end
