class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @house.update(house_params)
      redirect_to house_path(@house)
    else
      render :edit
    end
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :location, :description, :price)
  end

end
