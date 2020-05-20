class PagesController < ApplicationController
  PRICE_RANGES = {
    "cheap" => (10..20),
    "medium" => (21..50),
    "expensive" => (51..1000)
  }

  def home
    # @range = PRICE_RANGES[params[:search][:price]]
    if params[:search].nil?
      @houses_sample = House.all.sample(4)
    else
      filter
    end
  end

  private

  def filter
    @filter = params[:search][:location]
    @houses_sample = House.where('location ilike ?', "%#{@filter}%")
    # @houses_sample = House.where('location ilike ? AND price ilike ?',"%#{@filter}%", "%#{@range}%")  # We will return on this filter tomorrow
  end

end
