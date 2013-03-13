Ui::Application.routes.draw do 

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'home#index'
end
