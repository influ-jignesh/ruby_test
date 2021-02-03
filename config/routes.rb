Rails.application.routes.draw do
  resources :blogs
  resources :create_blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'
  get 'about', to: 'pages#about' 


  # My Articles Code start  
    get "get_articles" => "articles#get_all_article"
    get "get_articles/add/view" => "articles#add_article_view"
    post "add_article" => "articles#article_add"
    get "get_articles/edit/:data" => "articles#edit_article"
    post "update_article" => "articles#article_updated"
    get "get_articles/delete/:data" => "articles#delete_article"
  # My Articles Code end

  # My Articles Code start  
    get  "categories" => "categories#view_all_categories"  
    get  "add/new/category" => "categories#view_add_category"
    post "category/add" => "categories#add_category"  
    get  "category/edit/:catname" => "categories#edit_category" , as: 'category_edit'
    post "category/update" => "categories#update_category"
    get  "category/delete/:catname" => "categories#delete_category" , as: 'category_delete'
  # My Articles Code end


  resources :articles
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]

end
