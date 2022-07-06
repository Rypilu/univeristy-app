Rails.application.routes.draw do
  # courses controler # index action
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  # go to /about and send that to pages controller which will point to about view
  get 'about', to: 'pages#about'
  #  ~~~  using resources gives you all routes  ~~~
  #  students GET   /students(.:format)               students#index
  #  POST  /students(.:format)                        students#create
  #  new_student GET   /students/new(.:format)        students#new
  #  edit_student GET   /students/:id/edit(.:format)  students#edit
  #  student GET   /students/:id(.:format)            students#show
  #  PATCH /students/:id(.:format)                    students#update
  #  PUT   /students/:id(.:format)                    students#update
  resources :students, except: [:destroy]

end
