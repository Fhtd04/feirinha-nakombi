class OrdersController < ApplicationController
  before_action :set_product, only: [:new, :create]

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.product = @product

    if @order.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:order).permit(:quantity, :product_id)
  end

end
