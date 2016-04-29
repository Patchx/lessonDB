class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    unless admin?
      redirect_to page_path('denied')
    end
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
