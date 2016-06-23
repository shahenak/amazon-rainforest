class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    puts @user.name + "*******"
    if @user.save
      redirect_to products_url, notice: 'Signed up!'
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name) #returns sanitized params hash
  end
end
