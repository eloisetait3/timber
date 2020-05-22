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
    if params[:search].nil?
      @houses = House.all
    else
      filter
    end
  end

  def show
    @review = Review.new
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

  def filter
    @filter = params[:search][:location]
    @houses = House.where('location ilike ?', "%#{@filter}%")
    # @houses_sample = House.where('location ilike ? AND price ilike ?',"%#{@filter}%", "%#{@range}%")  # We will return on this filter tomorrow
  end

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name, :location, :description, :price, photos: [])
  end
end
