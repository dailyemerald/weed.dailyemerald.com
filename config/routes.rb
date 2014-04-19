Weed::Application.routes.draw do

  root to: 'app#user_submit'
  post '/submit' => 'app#submit'
  get '/results' => 'app#results'
  #resources :votes

  get '/login' => 'app#login'
  post '/login' => 'app#process_login'

  get '/moderate' => 'app#moderate'
  post '/approve_story/:id' => 'app#approve_story', as: :approve_story
  post '/unapprove_story/:id' => 'app#unapprove_story', as: :unapprove_story

end