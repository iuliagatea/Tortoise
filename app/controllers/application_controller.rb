# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_user
    return true if current_user

    flash[:danger] = 'You must be logged in to perform that action'
    redirect_to root_path
  end

  def require_partner
    return true if current_user.is_partner

    flash[:danger] = 'You must be a partner to perform that action'
    redirect_to root_path
  end
end
