# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the events app #{@user.full_name}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.fetch(:registration, {}).tap do |params|
      params[:type] = params[:is_partner] == '1' ? 'Partner' : 'Customer'
    end.permit(:type, :first_name, :last_name, :email, :password, :phone_number, :company, :description)
  end
end
