Rails.application.routes.draw do
  root to: 'pages#home'
  resources :appointments
  devise_for :users, :controllers => { :registrations => "registrations" }
end
