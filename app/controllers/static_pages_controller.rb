class StaticPagesController < ApplicationController
  def home
  	@products = Product.paginate(page: params[:page])
  	@prices = Price.paginate(page: params[:page])

  end


  def advertise
  end

  def about
  end

  def contact
  end
end
