class ApplicationController < Sinatra::Base
 
  set :default_content_type, 'application/json'
  # add routes

  get '/bakeries' do 
    bakeries = Bakery.all 
    bakeries.to_json
  end

  get '/bakeries/:id' do 
    bakery = Bakery.find_by(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do 
  
    by_price = BakedGood.all.order(:price).reverse
    by_price.to_json
  
  end

  get '/baked_goods/most_expensive' do 
      expensive = BakedGood.all.max_by{|good| good.price}
      expensive.to_json
  end

end
