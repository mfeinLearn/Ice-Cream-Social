Rails.application.routes.draw do
  # get the home route and send it to the sessions controller and send it to a method called welcome

  # the following is custom routes

  get '/' => 'sessions#welcome'
  # is going to take me to sessions#new to start a new session
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  # the only benifit of using (post '/signup' => 'users#create' is
  # when we refresh the page it will have sign up in the url
  post '/signup' => 'users#create' # we dont actually need this
  #creating a logout route need to use a delete
  delete '/logout' => 'sessions#destroy'

  # Going to recieve/accepting the request from them(google) and => send to our sessions controller
  # :provider - is a dynamic route(could be facebook, google etc...)
  # Because of this (:provider) their is now a param called provider
  ## and the session create will have a param called provider then we would go the
  ### omniauth way if we did have a param called provider.
  # if it does not have a param called provider (if it is doing a regular loggin then we will go the regular method(the route will change to a create))
  get '/auth/:provider/callback' => 'sessions#create'

  resources :reviews
  resources :ice_creams do
    resources :reviews, only: [:new, :index]
  end
  resources :brands
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
