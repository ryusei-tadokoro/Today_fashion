class StaticPagesController < ApplicationController
  def top
    @user = current_user if user_signed_in?
  end

  def privacy_policy; end
end
