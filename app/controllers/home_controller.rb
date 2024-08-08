# frozen_string_literal: true

# HomeController manages the home page of the application.
# It is responsible for rendering the main landing page.
class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to authenticated_root_path
    else
      render :index
    end
  end
end
