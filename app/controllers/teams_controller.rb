class TeamsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @team = Team.find(User.find(session[:user_id]).team_id)
    @team_members = User.all.where(team: @team)
  end

  def create
    user = User.find(session[:user_id])
    team = Team.new(name: params[:team][:name])
    if team.save
      user.update(team: team, team_authority: 2)
      flash[:notice] = "Team #{team.name} created! You are the team captain!"
      redirect_to "/teams"
    else
      flash[:notice] = "Something went wrong"
      redirect_to "/clients"
    end
  end

  def add_member
    begin
      user = User.find_by(email: params[:new_member][:email])
    rescue
      flash[:notice] = "User not found"
      return redirect_to '/teams'
    end
    team = Team.find(params[:new_member][:team_id])
    user.update(team: team, team_authority: params[:new_member][:team_authority])
    redirect_to '/teams'
  end

  def destroy
  end
end
