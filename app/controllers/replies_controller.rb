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
      @reply.add_to_event
      redirect_to need_path(@need)
    else
      flash[:notice] = @reply.errors.full_messages.join
      redirect_to new_reply_path(need_id: @need.id)
    end
  end

  def edit
    @reply = Reply.find(params[:id])
    @need = Need.find(@reply.need.id)
    unless @reply.user_id == session[:user_id]
      redirect_to need_path(@need)
    end
  end

  def update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      redirect_to need_path(@reply.need)
    else
      flash[:notice] = @reply.errors.full_messages.join
      redirect_to edit_reply_path(@reply)
    end
  end

  def show
  end

  def destroy
    @reply = Reply.find(params[:id])
    @need = @reply.need
    if @reply.user_id == session[:user_id]
      flash[:notice] = "Your reply was deleted!"
    else
      flash[:notice] = "Reply from #{@reply.user.name} was deleted!"
    end
    @reply.destroy
    redirect_to needs_path
  end

  private

  def reply_params
    params.require(:reply).permit(:yes, :comment, :need_id)
  end

end
