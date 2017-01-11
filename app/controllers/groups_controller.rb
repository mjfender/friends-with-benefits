class GroupsController < ApplicationController
  before_action :authorize_user
  before_action :set_user

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.set_admin(@user)
    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:user_id, :open, :title, :description, :photo, :location)
  end
end
