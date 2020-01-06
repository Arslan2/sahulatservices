Rails.application.routes.draw do
  get 'home/index'
  get 'booking', to: 'home#booking'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  post 'home/appointment'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
