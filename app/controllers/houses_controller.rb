class HousesController < ApplicationController
  def new
    @house = House.new
  end
  
  def create
    @house = House.new(houses_params)
    @user = current_user
    @house.user = @user
    @house.save
    if @house.save
      redirect_to house_path(@house)
    else
      render :new
    end
  end
  
  private

  def houses_params
    params.require(:house).permit(:name, :location, :description, :price)
  end
end
