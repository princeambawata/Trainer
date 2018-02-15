Rails.application.routes.draw do

  get 'coach_profile/profile'

  devise_for :users
  root to: "home#index"
  get '/profile/:id' => "home#profile"  
  get '/coach/signin' => "coach#signin_get"
  get '/coach/signup' => "coach#signup_get"
  post '/coach/signin' => "coach#signin"
  post '/coach/signup' => "coach#signup"
  get '/coach/profile' => "coach_profile#profile"
  delete '/coach/logout' => "coach#logout"


  namespace :api do
    namespace :v1 do
      post '/user/sign_in' => 'users_api#sign_in'
      post '/user/sign_up' => 'users_api#sign_up'
      post '/coach/sign_in' => 'coach_api#sign_in'
      post '/coach/sign_up' => 'coach_api#sign_up'
      get '/coach/feed' => 'coach_logged_in#feed'
      post '/coach/update_schedule' => 'coach_logged_in#schedule'
      post '/user/select_trainer' => 'users_logged_in#select_trainer'
      get '/user/feed' => 'users_logged_in#feed'
      get '/user/coach_profile' => 'users_logged_in#coach_profile'
      post '/user/update_profile' => 'users_logged_in#update_details'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
