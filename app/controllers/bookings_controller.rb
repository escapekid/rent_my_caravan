class BookingsController < ApplicationController
  before_action :set_caravan, only: [:new, :create]
  # before_save :set_not_confirmed
  def new
    @booking = Booking.new
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.caravan = @caravan
    @booking.confirmed = false
    if @booking.save
      redirect_to caravan_path(@caravan)
    else
      render :new
    end
  end

  def update
  end

  private

  def booking_params
    params[:booking].permit(:start_date, :end_date, :caravan_id)
  end

  def set_caravan
    @caravan = Caravan.find(params[:caravan_id])
  end

  def set_not_confirmed
    @booking.confirmed = false
    true
  end
end
