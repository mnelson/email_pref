Rails.application.routes.draw do
  
  resources :email_preferences, :controller => 'email_pref/email_preferences', :only => [:edit, :update] do
    get :unsubscribe
  end
  
end