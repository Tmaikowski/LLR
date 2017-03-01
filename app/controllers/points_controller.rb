class PointsController < ApplicationController
  def index

  end

  def create
    @user = User.find(session[:user_id])
    @client = Client.find(params[:point][:client_id])
    point = Point.new(
      # amount: params[:point][:amount],
      reason: params[:point][:reason],
      client: @client,
      user: @user,
      trans_type: params[:point][:trans_type]
    )
    if params[:point][:trans_type] == "Redeem"
      point.amount = params[:point][:amount].to_i * -1
      flash[:success] = "Points redeemed!"
    elsif params[:point][:trans_type] == "Award"
      point.amount = params[:point][:amount]
      flash[:success] = "Points added!"
    else
      flash[:success] = "Something went wrong"
      return redirect_to controller: "clients", action: "show", id: @client.id
    end
    point.save
    redirect_to controller: "clients", action: "show", id: @client.id
  end
end
