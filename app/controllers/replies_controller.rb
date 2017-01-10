class RepliesController < ApplicationController

  def new
      @reply = Reply.new
      @need = Need.find(params[:need_id])
  end

  def create
    set_user
    @need = Need.find(params[:reply][:need_id].to_i)
    @reply = Reply.new(reply_params)
    @reply.user_id = @user.id
    if @reply.save
      redirect_to need_path(@need)
    else
      # add flash message
      redirect_to new_reply_path(need_id: @need.id)
    end
  end

  def edit

  end

  def update

  end

  private

  def reply_params
    params.require(:reply).permit(:yes, :comment, :need_id)
  end

end
