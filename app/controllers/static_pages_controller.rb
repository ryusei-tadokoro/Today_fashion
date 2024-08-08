# frozen_string_literal: true

# StaticPagesController manages static pages of the application.
# It includes actions for displaying the top page and the privacy policy.
class StaticPagesController < ApplicationController
  def top
    @user = current_user if user_signed_in?
  end

  def privacy_policy; end
end
