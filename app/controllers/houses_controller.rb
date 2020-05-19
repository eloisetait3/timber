class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update]
  
  def new
    @house = House.new
  end
  
  def create
    @house = House.new(house_params)
    @user = current_user
    @house.user = @user
    @house.save
    if @house.save
      redirect_to house_path(@house)
    else
      render :new
    end
  end
 
  def index
  	@houses = House.all
  end
 
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
