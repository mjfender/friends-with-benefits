class NeedsController < ApplicationController
  before_action :authorize_user
  before_action :set_user

  def new
    @need = Need.new
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

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def need_params
    params.require(:need).permit(:headline, :description, :expiration)

end