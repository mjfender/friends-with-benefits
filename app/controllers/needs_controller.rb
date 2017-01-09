class NeedsController < ApplicationController
  # before_action :authorize_user
  before_action :set_user

  def new
    @need = Need.new unless params[:need]
    @need = params[:need] if params[:need]
  end

  def index
    @needs = Need.mine_and_theirs(@user_id)
    @user_needs = @needs[:my_needs]
    @other_needs = @needs[:others_needs]
  end

  def show
    @need = Need.find(params[:id])
  end

  def create
    @new_need = Need.new(need_params)
    @new_need.user = @user
    if @new_need.save 
      redirect_to @new_need
    else
      binding.pry #need to test this- unsure!
      redirect_to new_need_path(:need => @new_need)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def need_params
    params.require(:need).permit(:headline, :description, :expiration, :completed, :perk)
  end
end