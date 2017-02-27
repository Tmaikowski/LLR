class SalesController < ApplicationController
  def create
    sale = Sale.new(
      user: User.find(session[:user_id]),
      client: Client.find(params[:sale][:client]),
      product: Product.find(params[:product][:id]),
      sales_code: SalesCode.first,
      sale_price: params[:sale][:sale_price]
    )
    if sale.save
      flash[:success] = "Sale created!"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to controller: "clients", action: "show", id: sale.client_id
  end

  def destroy
    sale = Sale.find(params[:id]).destroy
    flash[:success] = "Sale deleted!"
    redirect_to controller: "clients", action: "show", id: sale.client_id
  end

  private

  def sale_params
    params.require(:sale).permit(
      :client,
      :product
    )
  end
end
