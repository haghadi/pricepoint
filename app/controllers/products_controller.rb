class ProductsController < ApplicationController
  # before_filter :signed_in_user, only: [:index, :edit, :update]
  # before_filter :correct_user,   only: [:edit, :update]
  # before_filter :admin_user, only: [:index, :edit, :update]

  def new
  	@product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    # @product.stores << current_user.store
    if @product.save
      flash[:success] = "Product Created"
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def index
      #@products = Product.paginate(page: params[:page])
    @products = Product.search(params[:search])
    @prices = Price.paginate(page: params[:page])

  end



   def smartphones
    @products = Product.paginate(page: params[:page])
        @prices = Price.paginate(page: params[:page])

   end

  def lcds
    @products = Product.paginate(page: params[:page])
        @prices = Price.paginate(page: params[:page])

  end



  def consoles
    @products = Product.paginate(page: params[:page]) 
    @prices = Price.paginate(page: params[:page])

  end




  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product destroyed"
    redirect_to root_path
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] = "Product Updated"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def show
  	@product = Product.find(params[:id])
    @prices = Price.paginate(page: params[:page])
  end

  private
    def admin_user
      if signed_in?
        redirect_to(root_path) unless current_user.admin?
      else
        redirect_to(root_path)
      end
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to login_path, notice: "Please sign in."
      end
    end

    def correct_user
      if !current_user.admin? || !current_user.storeOwner?
        @product = Product.find(params[:id])
      end
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Unauthorized"
      redirect_to products_path
    end
end
