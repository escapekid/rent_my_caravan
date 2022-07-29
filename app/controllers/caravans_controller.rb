class CaravansController < ApplicationController

  def index
    @caravans = Caravan.all
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
    # need to add set_user method to find a user/user_id
    @caravan = Caravan.find(params[:id])
  end

  # def destroy
  #   if @caravan.destroy
  #     redirect_to caravan_path(@caravan)
  #   else
  #     render :index
  #   end
  # end

  private

  def caravan_params
    params.require(:caravan).permit(:name, :price, :description, :address, :availability, :number_of_guests, :photo)
  end
end
