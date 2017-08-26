class ProfileController < ApplicationController
  def index
    if current_user
      @works = Work.where(user_id: current_user.id)
    else
      redirect_to new_user_session_path, notice: 'You are not currently logged in.'
    end
  end
  def edit_user_info
    respond_to do |format|
      format.js {render layout: false} 
    end
  end
  def show
    if current_user
      @works = Work.where(user_id: current_user.id)
    else
      redirect_to new_user_session_path, notice: 'You are not currently logged in.'
    end
  end
  def show_creator
    @works = Work.where(user_id: params[:user_id])
  end
end
