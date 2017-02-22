class SalesController < ApplicationController
  def create
    sale = Sale.new(sale_params)
    if sale.save
      flash[:success] = "Sale created!"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to controller: "clients", action: "show", id: sale.client_id
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    @sale.update(sale_params)
    flash[:success] = "Sale updated!"
    redirect_to controller: "clients", action: "show", id: @sale.client_id
  end

  def destroy
    sale = Sale.find(params[:id]).destroy
    flash[:success] = "Sale deleted!"
    redirect_to controller: "clients", action: "show", id: sale.client_id
  end

  private

  def sale_params
    params.require(:sale).permit(
      :prod_name,
      :prod_size,
      :prod_price,
      :client_id
    )
  end
end
