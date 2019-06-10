class UsersController < ApplicationController
before_action :require_user_logged_in, only: [:show, :edit]
  include SessionsHelper
  def index

  end

  def show
    @user = User.find(current_user.id)
    @spots = @user.spots.order(id: :desc).page(params[:page])
    counts(@user)
    @visits = current_user.likes.order(id: :desc).page(params[:page])
    #@all_ranks = @visits.find(Spot.group(:prefecture).order('count(prefecture) desc').limit(3).pluck(:prefecture))
    @all_ranks = current_user.likes.group(:prefecture).order('count(prefecture) desc').limit(3).pluck(:prefecture)
  end

  def new
    @user = User.new
  end
  
  def confirm_new
    @user = User.new(user_params)
    unless @user.valid?
      render :new 
      flash[:danger] = '入力内容に謝りがあります。'
    end
  end

  def create
    @user = User.new(user_params)
    if params[:back].present?
      render :new
      return
    end
    if @user.save
      flash[:success] = "ユーザー登録しました"
      redirect_to login_path
    else
      flash[:danger] = "ユーザー登録失敗しました"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def upldate
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)  
  end
end
