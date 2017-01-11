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
    if @group.is_admin?(@user)
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
    if @group.is_admin?(@user)
      @membership = Membership.find_by(group_id: params[:group_id], user_id: params[:user_id])
      @membership.approved = true
      @membership.save
    end
    redirect_to @membership.group
  end

  def deny_membership_request
    @group = Group.find(params[:group_id])
    if @group.is_admin?(@user)
      @membership = Membership.find_by(group_id: params[:group_id], user_id: params[:user_id])
      @membership.approved = false
      @membership.save
    end
    redirect_to @membership.group
  end
end
