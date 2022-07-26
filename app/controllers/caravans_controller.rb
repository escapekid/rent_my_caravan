class CaravansController < ApplicationController
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

  private

  def caravan_params
    params.require(:caravan).permit(:name, :price, :description, :address, :availability, :number_of_guests)
  end
end
