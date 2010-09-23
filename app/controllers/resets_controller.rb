class ResetsController < ApplicationController
  def create
    Message.destroy_all
    User.destroy_all
    redirect_to root_url
  end
end