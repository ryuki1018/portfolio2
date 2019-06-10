class SpotsController < ApplicationController
  # mount_uploader :image, ImageUploader
  before_action :require_user_logged_in, only: [:new, :edit, :destroy]
  include SessionsHelper
  def index
    @spots = Spot.order(id: :desc).page(params[:page]).per(10)
    @query = Spot.ransack(params[:q])
    @articles = @query.result(distinct: true)
  end

  def show
      @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = current_user.spots.build(spots_params)
    if @spot.save
      flash[:success] = '投稿しました'
      redirect_to :users_show
    else
      flash[:danger] = '修正してください'
      render 'spots/new'
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    
    if @spot.update(spots_params)
      flash[:success] = '変更されました'
      redirect_to @spot
    else
      flash[:danger] = '変更できませんでした'
      render :edit
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    
    if @spot.destroy
      flash[:success] ='投稿を削除しました'
      redirect_to spot_url
    else
      
    end
  end
  
  def search
    @posts = Spot.search(params[:search]).page(params[:page])
    @post = params[:search]
  end

  
  private
  def spots_params
    params.require(:spot).permit(:prefecture,:city,:name,:content,:image)
  end
end
