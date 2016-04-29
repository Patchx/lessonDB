class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    redirect_to page_path('denied') unless authorized?
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
