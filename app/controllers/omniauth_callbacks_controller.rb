class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in with twitter!"
      session["devise.token"] = request.env["omniauth.auth"]["credentials"]["token"]
      session["devise.secret"] = request.env["omniauth.auth"]["credentials"]["secret"]
      binding.pry 
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_path
    end
  end
  alias_method :twitter, :all
end