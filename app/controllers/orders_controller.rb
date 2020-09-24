class OrdersController < ApplicationController
  before_action :set_product, only: [:new, :create]

  def show
    @order = Order.find(params[:id])
    @product = Product.find(@order.product_id)
    @user = User.find(@order.user_id)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.product_id = params[:product_id]

    if @order.save
      redirect_to product_order_path(@product.id, @order.id)
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:order).permit(:ask, :product, :user)
  end

end
