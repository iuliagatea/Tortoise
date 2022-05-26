# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, except: %i[index new create]
  before_action :set_service, only: %i[new create]
  before_action :require_user

  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new
    @date = "18.05.2022".to_date
    time_slot = TimeSlot.new(@service, @date)
    @slots = Rails.configuration.params['interval_slots'] ? time_slot.interval_slots : time_slot.slots
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = 'Appointment was successfully created.'
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @appointment.update(appointment_params)
      flash[:success] = 'Appointment was successfully updated.'
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to root_path
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_service
    @service = Service.find(params[:service_id])
  end

  def appointment_params
    params.fetch(:appointment, {}).permit(:date, :from_time, :to_time, :is_honoured, :service_id, :customer_id).tap { |params|
      params[:customer] = current_user unless current_user.is_partner
      params[:service_id] = @service.id
    }
  end
end
