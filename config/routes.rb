Rails.application.routes.draw do
  get 'planets/show'
  get 'starships/show'
  get 'people/show'
  get 'welcome/index'
  root 'welcome#index'

  get '/films/:id', to: 'films#show'
    get '/people/:id', to: 'people#show'
        get '/starships/:id', to: 'starships#show'
        get '/planets/:id', to: 'planets#show'

end
