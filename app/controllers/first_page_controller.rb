class FirstPageController < ApplicationController
  before_action :redirect_signed_in_user, only: [:index]
  def index; end

  private

  def redirect_signed_in_user
    redirect_to root_path if user_signed_in?
  end
end
