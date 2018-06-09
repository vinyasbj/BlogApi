Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :categories
    end
  end
  namespace :api do
  	namespace :v1 do
  		resources :articles
  	end	
  end
end
