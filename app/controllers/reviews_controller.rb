class ReviewsController < ApplicationController
  def new
    # in a nested route we want our review to already know about
    # the ice cream that it is associated with

    # the :id in the params is now :ice_cream_id instead of :id
    # because in a nested route :id is now called :ice_cream_id
    # instead of just id

    # once we add a nested route the ice cream id turns into :ice_cream_id
    if @ice_cream = IceCream.find_by_id(params[:ice_cream_id])
      # an ice cream has many reviews
      @review = @ice_cream.reviews.build
    else
      @review = Review.new 
    end
    # IF we came from the review it would say build ice cream
    # @review.build_ice_cream

# when we now post to the controller and submit this review
# do i have to do anything special because it is nested?
  ## because I am using a hidden field when I post this route it is
  ## actually going to post to our normal route like it is a normal review(/review).
  #### this is if we use only one instence of @review in the form_for in the new view

# If we wanted to post it to a nested route we could just pass in both instance
## in the form for: <%= form_for([@ice_cream, @review]) %>

  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  def index
    # how do I check if it's nested & a valid id

    # if params[:ice_cream_id]
    #### we are checking to see if it is a valid ice cream id and not just that it is nested
    if @ice_cream = IceCream.find_by_id(params[:ice_cream_id])
    #nested
    # we want our reviews to be all of the reviews of
    # one ice cream

      @reviews = @ice_cream.reviews
    else
      #it's not nested
      @reviews = Review.all
    end
  end

  private

  def review_params
    params.require(:review).permit(:ice_cream_id, :content, :stars, :title)
  end
end
