class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
    @house = House.find(params[:house_id])
  end

  def create
  	@house = House.find(params[:house_id])
  	@review = Review.new(review_params)
  	@review.house = @house
  	@review.user = current_user
  	if review.save
  	  redirect_to house_path(@house)
  	else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :house_id)
  end

end
