UserAuth::Application.routes.draw do

  match ':controller(/:action(/:id))(.:format)'
  root :to => 'sessions#login'
  match "signup", :to => "users#new"
  match "login", :to => "sessions#login"
  match "logout", :to => "sessions#logout"
  match "home", :to => "sessions#home"
  match "profile", :to => "sessions#profile"
  match "setting", :to => "sessions#setting"
  match "update", :to => "sessions#update"
  match "getcontext", :to => "sessions#getcontext"
  match "generatetoken", :to => "sessions#generatetoken"
end
