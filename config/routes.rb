Rails.application.routes.draw do
  resources :boards, only: %i[index new create show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 
