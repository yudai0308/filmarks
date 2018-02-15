class UsersMembersController < ApplicationController

  def create
    # binding.pry
    UsersMember.create(member_id: params[:member_id], user_id: current_user.id)
    @member = Member.find(params[:member_id])
    @fan = UsersMember.find_by(member_id: params[:member_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json
    end
  end

  def destroy
    # binding.pry
    fan = UsersMember.find_by(member_id: params[:member_id], user_id: current_user.id)
    fan.destroy
    @member = Member.find(params[:member_id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json
    end
  end

end
