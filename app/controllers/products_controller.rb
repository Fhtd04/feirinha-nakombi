class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @order = Order.new
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
      redirect_to @product, notice: "Produto criado!"
    else
      render :new
    end
  end

  def update
    if @product.user != current_user
      redirect_to products_path, alert: "Você não tem autorização!"
      return
    end

    @product.update(product_params)
    redirect_to @product, notice: "Produto atualizado!"
  end

  def destroy
    if @product.user != current_user
      redirect_to root_path, alert: "Você não tem autorização!"
      return
    end

    @product.destroy
    redirect_to products_url, notice: "Produto deletado!"
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :quantity, :price, :user_id, :photo)
    end
end
