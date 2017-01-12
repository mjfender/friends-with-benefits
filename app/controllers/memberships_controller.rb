class MembershipsController < ApplicationController
  before_action :authorize_user
  before_action :set_user


  def new
    @membership = Membership.new
    @membership.group = Group.find(params[:group_id])
    @membership.user = @user
    @membership.save
    redirect_to @membership.group
  end


  def request_admin
    @membership = Membership.find_by(group_id: params[:group_id], user_id: params[:user_id])
    @membership.request_admin = Time.now
    @membership.save
    redirect_to @membership.group
  end


  def deny_admin
    @group = Group.find(params[:group_id])
    if @group.admin?(@user)
      @membership = Membership.find_by(group_id: params[:group_id], user_id: params[:user_id])
      @membership.request_admin = nil
      @membership.save
    end
    redirect_to @membership.group
  end


  def toggle_admin
    @membership = Membership.find_by(group_id: params[:group_id], user_id: params[:user_id])
    @membership.request_admin = nil
    @membership.toggle(:admin)
    @membership.save
    redirect_to @membership.group
  end


  def request_invite
    @membership = Membership.new
    @membership.group = Group.find(params[:group_id])
    @membership.user = @user
    @membership.request_invite = Time.now
    @membership.save
    redirect_to @membership.group
  end


  def approve_membership_request
    @group = Group.find(params[:group_id])
    if @group.admin?(@user)
      @membership = Membership.find_by(group_id: params[:group_id], user_id: params[:user_id])
      @membership.approved = true
      @membership.save
    end
    redirect_to @membership.group
  end


  def deny_membership_request
    @group = Group.find(params[:group_id])
    if @group.admin?(@user)
      @membership = Membership.find_by(group_id: params[:group_id], user_id: params[:user_id])
      @membership.approved = false
      @membership.save
    end
    redirect_to @membership.group
  end


  def revoke
    @group = Group.find(params[:group_id])
    if @group.admin?(@user)
      @membership = Membership.find_by(group_id: params[:group_id], user_id: params[:user_id])
      @membership.destroy
    end
    flash[:notice] = "You have removed #{User.find(params[:user_id]).name} from your group"
    redirect_to @membership.group
  end


  def approve_all_memberships
    @group = Group.find(params[:group_id])
    if @group.admin?(@user)
      @memberships = Membership.where(group_id: params[:group_id], approved: nil)
      @memberships.each do |member|
        member.approved = true
        member.save
      end
    end
    redirect_to @group
  end

end

