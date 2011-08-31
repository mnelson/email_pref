class EmailPref::EmailPreferencesController < ApplicationController
  
  before_filter :get_it
  
  def edit; end
  
  def update
    if @email_preference.update_attributes(params[:email_preference])
      redirect_to @email_preference.emailable
    else
      render :action => 'edit'
    end
  end
  
  
  private
  
  def get_it
    @email_preference = EmailPreference.find(params[:id])
  end
  
end