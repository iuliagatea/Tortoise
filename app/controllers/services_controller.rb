# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :set_service, except: %i[index new create]
  before_action :require_partner, except: %i[index show]
  before_action :set_partner, only: %i[index]

  def index
    @services = @partner.services
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = 'Service was successfully created.'
      redirect_to services_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @service.update(service_params)
      flash[:success] = 'Service was successfully updated.'
      redirect_to services_path
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def set_partner
    @partner = current_user.is_partner ? current_user : Partner.find(params[:partner_id])
  end

  def service_params
    params.fetch(:service, {}).permit(:name, :price, :duration).tap do |params|
      params[:partner] = current_user
    end
  end
end
