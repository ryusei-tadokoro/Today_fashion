# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to authenticated_root_path
    else
      render :index
    end
  end
end
