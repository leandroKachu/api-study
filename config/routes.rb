Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :kinds
  resources :contacts


  # api_version é uma gem versionist que nos possibilita passar como parametro um chave e valor e com isso chamar um controller especifico
  # api_version(:module => "V1", :parameter => {:name => "version", :value => "1"}) do
  #   resources :contacts do
#       # # resource :kind, only: [:show] 
  #     # resource :kind, only: [:show], path: 'relationships/kind '
  #     # resource :phones, only: [:show] 
  #     # resource :phones, only: [:show], path: 'relationships/phones ' 
  #   end
  # end

  # api_version(:module => "V2", :parameter => {:name => "version", :value => "2"}) do
  #   resources :contacts do 
  #     # resource :kind, only: [:show], path: 'relationships/kind '
  #     # resource :phones, only: [:show] 
  #     # resource :phones, only: [:show], path: 'relationships/phones ' 
  #   end
  # end
end
