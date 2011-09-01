class EmailPref::EmailPreferencesController < ApplicationController
  
  before_filter :get_it
  
  def edit; end
  
  def update
    if @email_preference.update_attributes(params[:email_preference])
      redirect_to @email_preference.emailable, :notice => @email_preference.unsubscribed? ? 'You have successfully been unsubscribed.' : 'You have successfully updated your email preferences.'
    else
      render :action => 'edit'
    end
  end
  
  def unsubscribe
    @email_preference.unsubscribe_all!
    redirect_to @email_preference.emailable, :notice => 'You have successully been unsubscribed.'
  end
  
  
  private
  
  def get_it
    @email_preference = EmailPref::EmailPreference.find(params[:id])
  end
  
end