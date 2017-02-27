class ProductsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @products = Product.all.where(user: @user)
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = User.find(session[:user_id])
    if @product.save
      flash[:notice] = "Product created!"
    else
      flash[:notice] = "Something went wrong"
    end
    redirect_to '/products'
  end

  private

  def product_params
    params.require(:product).permit(
      :prod_name,
      :prod_size,
      :prod_price,
      :prod_quantity,
      :prod_pic
    )
  end
end
