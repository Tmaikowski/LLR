class ClientsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @clients = Client.all.where(user: @user)
    @client = Client.new
    @team = Team.new
  end

  def show
    @client = Client.find(params[:id])
    @products = Product.all.where(user: User.find(session[:user_id]))
    @sale = Sale.new(client: @client)
    @sales = Sale.all.where(client: @client).order(created_at: :desc)
  end

  def create
    @user = User.find(session[:user_id])
    client = Client.new(client_params)
    client.loyalty_level = 1
    client.points = 0
    client.user = @user
    if client.save
      flash[:notice] = "New client created!"
    else
      flash[:notice] = "Something went wrong..."
    end
    redirect_to '/clients'
  end

  def update_loyalty_level
    client = Client.find(params[:client][:client_id])
    client.loyalty_level = params[:client][:loyalty_level]
    client.save
    flash[:success] = "Updated reward status!"
    redirect_to action: 'show', id: client.id
  end

  def add_points
    client = Client.find(params[:client][:client_id])
    client.points += params[:client][:points].to_i
    client.save
    flash[:success] = "Rewarded points!"
    redirect_to action: 'show', id: client.id
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
