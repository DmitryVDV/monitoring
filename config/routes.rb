Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'meters/meter_data', defaults: { format: 'json' }
  resources :meters

end
