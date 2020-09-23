class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show

  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to @product, notice: "Product was created!"
    else
      render :new
    end
  end

  def update
    if @product.user != current_user
      redirect_to products_path, alert: "Not authorized!"
      return
    end

    @product.update(product_params)
    redirect_to @product, notice: "Product was updated!"
  end

  def destroy
    if @product.user != current_user
      redirect_to root_path, alert: "Not authorized!"
      return
    end

    @product.destroy
    redirect_to products_url, notice: "Restaurant was destroyed!"
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :quantity, :price, :user_id)
    end
end
