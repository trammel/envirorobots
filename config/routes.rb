Envirorobots::Engine.routes.draw do
  get '/robots.txt' => 'robots#show', as: :robots, format: false
  get '/robots', to: redirect('/robots.txt'), format: false
end
