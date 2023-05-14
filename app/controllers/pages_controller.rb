class PagesController < ApplicationController
  def about

  end

  def reviews
    render "pages/reviews/review"
  end
end
