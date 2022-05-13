class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  def index
    @users = params[:search].present? ? user_query : User.all
    render json: {users: @users.map {|user | UserSerializer.new(user)}}
  end

  def show
    user = User.find(params[:id])
    render json: {user: UserSerializer.new(user)}
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :born_on, :is_admin)
    end

    def user_query
      User.where("lower(last_name) LIKE  ?", "#{params[:search]}%")
    end
end
