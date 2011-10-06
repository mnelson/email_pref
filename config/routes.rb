Rails.application.routes.draw do
  
  resources :email_preferences, :controller => 'email_pref/email_preferences', :only => [:edit, :update] do
    member do
      get :unsubscribe
    end
  end
  
end