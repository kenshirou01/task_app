Rails.application.routes.draw do
  root to: 'schedules#index'
  get 'schedules/index', to: 'schedules#index'
  resources :schedules
end
