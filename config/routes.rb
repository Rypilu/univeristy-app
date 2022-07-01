Rails.application.routes.draw do
  # courses controler # index action
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  # go to /about and send that to pages controller which will point to about view
  get 'about', to: 'pages#about'

end
