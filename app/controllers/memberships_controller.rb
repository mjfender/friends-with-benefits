class MembershipsController < ApplicationController
  before_action :authorize_user
  before_action :set_user


  def new
    member = Membership.new
    member.group = Group.find(params[:group_id])
    member.user = @user
    member.save
    redirect_to member.group
  end
end
