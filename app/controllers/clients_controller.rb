class ClientsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @clients = Client.all.where(user: @user)
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
    @sale = Sale.new
    @sales = Sale.all.where(client: @client).order(created_at: :desc)
  end

  def create
    @user = User.find(session[:user_id])
    client = Client.new(client_params)
    client.user = @user
    if client.save
      flash[:notice] = "New client created!"
    else
      flash[:notice] = "Something went wrong..."
    end
    redirect_to '/clients'
  end

  private

  def client_params
    params.require(:client).permit(
      :first_name,
      :last_name,
      :email
    )
  end
end
