class PricesController < ApplicationController

  def new
  @price = Price.new
  @product = Product.find(params[:product])
  @price.product = @product
  end



  def create
     # @products = Product.paginate(page: params[:page])

    @price = Price.new(params[:price])
    # @price.product_id << product.product_id
    # @product = Product.find(params[:product])
    @price.store_id = current_user.store.id
    # @price.product_id = @product.product_id

    if @price.save
      flash[:success] = "Price Added"
       # redirect_to @price.product(:product => product.id) 
       redirect_to @price.product

    else
      render 'new'
    end

  end

  def edit 
   @price = Price.find(params[:id])
  
  end

  def index
     @products = Product.paginate(page: params[:page])

  end

  def show
    @price = Price.find(params[:id])

  end


   def smartphones
    @products = Product.paginate(page: params[:page])
   end

  def lcds
    @products = Product.paginate(page: params[:page])
  end


  def consoles
    @products = Product.paginate(page: params[:page]) 
  end


end


