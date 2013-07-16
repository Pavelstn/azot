Azot::Application.routes.draw do
   devise_for :users
   mount Usermanage::Engine => "/usermanage"
  
  get "/stat/destroy_all"  =>"stat#destroy_all"
  get "/stat" => "stat#index"

  get "main/index"

  get '/userapi/getrandomforvk/:id' => 'userapi#getrandomforvk', :id => :id 
  get '/userapi/getrandomfortwitter/:id' => 'userapi#getrandomfortwitter', :id => :id 
  get '/userapi/getrandomforfkuban/:type_id/:region_id' => 'userapi#getrandomforfkuban', :type_id => :type_id, :region_id=> :region_id 
  match '/userapi/dealclick/:id'=> 'userapi#dealclick', :id => :id
  #match '/userapi/visit/:id'=> 'userapi#visit', :id => :id
  
  resources :partners

  resources :regions

  post "deals/index"
  get "deals/destroy_all"
  resources :deals

  resources :categories

  resources :types

  mount Ckeditor::Engine => '/ckeditor'

  match '/detail/:id'=> 'main#detail', :id => :id 
  match '/:category'=> 'main#category', :category => :category
  match '/:category/:subcategory'=> 'main#subcategory', :category => :category, :subcategory => :subcategory
  #  match '/:category/:id'=> 'main#detail', :category => :category, :id => :id
  match '/:category/:subcategory/:id'=> 'main#detail', :category => :category, :subcategory => :subcategory, :id=>:id
 # match '/catalog/:category/:subcategory'=> 'main#subcategory', :category => :category, :subcategory => :subcategory

   root :to => 'main#index'

end
