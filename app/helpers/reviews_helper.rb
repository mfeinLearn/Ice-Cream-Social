module ReviewsHelper
  def display_helper(review)
    if params[:ice_cream_id]
      h1.tag("Add a Review for #{review.ice_cream.flavor} - #{review.ice_cream.brand.name}")
    else
      content_tag(:h1, "Create a review")
    end
  end
end
