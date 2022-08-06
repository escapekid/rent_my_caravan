class CaravansController < ApplicationController
  before_action :set_caravan, only: [:show, :destroy]

  def index
    @caravans = Caravan.all
    # @caravans = @caravans.order(price: :desc)
    @markers = @caravans.geocoded.map do |caravan|
      {
        lat: caravan.latitude,
        lng: caravan.longitude,
        info_window: render_to_string(partial: "info_window", locals: { caravan: caravan })
      }
    end

  end

  def new
    @caravan = Caravan.new
  end

  def create
    @caravan = Caravan.new(caravan_params)
    @caravan.user = current_user
    @caravan.save
    if @caravan.save
      redirect_to caravan_path(@caravan)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def destroy
    if @caravan.destroy
      redirect_to caravans_path
    else
      render :index
    end
  end

  private

  def set_caravan
    @caravan = Caravan.find(params[:id])
  end

  def caravan_params
    params.require(:caravan).permit(:name, :price, :description, :address, :availability, :number_of_guests, :photo)
  end
end
