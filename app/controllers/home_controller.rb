# frozen_string_literal: true

class HomeController < ApplicationController

  def index
    redirect_to appointments_path if current_user

    @partners = Partner.last(5)
  end
end
