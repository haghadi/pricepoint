class StoresController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params[:store])
    @store.user = current_user
    if @store.save
      flash[:success] = "Store created!"
      redirect_to @store
    else
      render 'new'
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(params[:store])
      flash[:success] = "Store Updated"
      redirect_to @store
    else
      render 'edit'
    end
  end

  def index
    @stores = Store.paginate(page: params[:page])
  end

  def destroy
    Store.find(params[:id]).destroy
    flash[:success] = "Store destroyed"
    redirect_to users_path
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to root_path, notice: "Please sign in."
      end
    end

    def correct_user
      if !current_user.admin? || !current_user.storeOwner?
        @store = current_user.stores.find(params[:id])
      end
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Unauthorized"
      redirect_to root_path
    end
end
