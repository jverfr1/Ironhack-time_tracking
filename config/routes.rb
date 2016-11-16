Rails.application.routes.draw do
  get '/', to: 'site#home'

  get '/contact', to: 'site#contact'

  get '/calculator', to: 'site#calculator'

  post '/calculate', to: 'site#calculate'

  get '/projects', to: 'projects#index'

  get '/projects/new', to: 'projects#new'
  
  post '/projects', to: 'projects#create'

  get '/projects/:id', to: 'projects#show' 


end
