class CaravansController < ApplicationController
  def new
    @caravan = Caravan.find(params[:caravan_id])
    @caravan = Caravan.new
  end

  def create
    @caravan = Caravan.new(params)
    @caravan = Caravan.find(params[:caravan_id])
    @caravan.save
    if @caravan.save
      redirect_to caravan_path(@caravan)
    else
      render :new
    end
  end
end
