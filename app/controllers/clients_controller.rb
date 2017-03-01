class ClientsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @clients = Client.all.where(user: @user)
    @client = Client.new
  end

  def show
    @client = Client.find(params[:id])
    @point = Point.new
    @points = Point.where(client: @client)
  end

  def create
    @user = User.find(session[:user_id])
    client = Client.new(client_params)
    client.reward = Reward.first
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
    client.reward = Reward.find(params[:client][:reward][:level].to_i)
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
