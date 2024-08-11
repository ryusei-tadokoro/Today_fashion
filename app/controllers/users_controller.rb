# frozen_string_literal: true

# UsersController manages the user profile and related actions.
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
