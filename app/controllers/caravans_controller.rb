class CaravansController < ApplicationController

  def index
    @caravans = Caravan.all
  end
end
