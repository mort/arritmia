ActionController::Routing::Routes.draw do |map|
  map.resources :zines


  #map.resources :units 
  map.resource :zine
  
  map.resources :users do |users|
    users.resources :units
  end
  
  map.resource  :sessions
  
  map.connect '/', :controller => 'sessions', :action => 'new'
  
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
