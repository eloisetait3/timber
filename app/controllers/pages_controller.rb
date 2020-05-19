class PagesController < ApplicationController
  def home
    @houses_sample = House.all.sample(4)
  end
end
