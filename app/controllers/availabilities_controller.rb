# frozen_string_literal: true

class AvailabilitiesController < ApplicationController
  before_action :set_availability, except: %i[index new create]
  before_action :require_partner

  def index
    @availabilities = current_user.availabilities
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
    if @availability.save
      flash[:success] = 'Availability was successfully created.'
      redirect_to availability_path(@availability)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @availability.update(availability_params)
      flash[:success] = 'Availability was successfully updated.'
      redirect_to availability_path(@availability)
    else
      render :edit
    end
  end

  def destroy
    @availability.destroy
    redirect_to root_path
  end

  private

  def set_availability
    @availability = Availability.find(params[:id])
  end

  def availability_params
    params.fetch(:event, {}).permit(:wday, :date, :from_time, :to_time).tap do |params|
      params[:partner] = current_user
    end
  end
end
