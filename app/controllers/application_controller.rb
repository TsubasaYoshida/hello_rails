class ApplicationController < ActionController::Base
  def after_sign_in_path_for(user)
    blogs_path
  end

  private

  def sign_in_required
    redirect_to home_index_url unless user_signed_in?
  end
end
