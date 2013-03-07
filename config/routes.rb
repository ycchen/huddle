Huddle::Application.routes.draw do

  resource :dashboard, :only => [:show]

  resources :status_reports

  resources :projects

  devise_for :users

  namespace :api do
    resources :posts
  end

  match 'home/recentposts'
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  match '*path(.:format)', :to => 'application#routing_error'
end
