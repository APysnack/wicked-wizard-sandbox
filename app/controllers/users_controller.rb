class UsersController < ApplicationController

  # GET /users/new
  def new
    @user = User.new
  end
  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_steps_path
    else
      render :new
    end
  end

  def destroy_session
    reset_session
    redirect_to root_path
  end

  def destroy_all_users
    User.destroy_all
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit!
    end
end
