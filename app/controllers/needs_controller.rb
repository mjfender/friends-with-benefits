class NeedsController < ApplicationController
  before_action :authorize_user
  before_action :set_user

  def new
    @need = Need.new
  end

  def create
    @new_need = Need.new(need_params)
    @new_need.user = @user
    if @new_need.save
      redirect_to @new_need
    else
      flash[:notice] = @new_need.errors.full_messages.join(" ")
      redirect_to new_need_path
    end
  end

  def index
    @needs = Need.mine_and_theirs(@user.id)
    @user_needs = @needs[:my_needs]
    @other_needs = @needs[:others_needs]
    @reply = Reply.new
  end

  def show
    @need = Need.find(params[:id])
    @replies = @need.replies

  end


  def edit
    @need = Need.find(params[:id])
    unless @need.user_id == session[:user_id]
      redirect_to need_path(@need)
    end
  end

  def update
    @need = Need.find(params[:id])
    if @need.update(need_params)
      redirect_to @need
    else
      flash[:notice] = @need.errors.full_messages.join(" ")
      redirect_to edit_need_path(@need)
    end

  end

  def destroy
    @need = Need.find(params[:id])
    flash[:notice] = "Your need was deleted!"
    @need.destroy
    redirect_to needs_path
  end

  def remove_from_group
    @group = Group.find(params[:group_id])
    @need = Need.find(params[:need_id])
    if @user == @group.admin?(@user) || @user = @need.user
      @need.groups.delete(params[:group_id])
      @need.save
    end
    redirect_to @group
  end

  def remove_participant
    @need = Need.find(params[:need_id])
    Reply.where(need_id: params[:need_id], user_id:params[:id], yes: true ).delete_all
    redirect_to @need
  end

  private
  def need_params
    params.require(:need).permit(:headline, :description, :expiration, :completed, :perk, group_ids: [])
  end
end
