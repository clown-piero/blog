class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:mypage, :logout, :edit, :update]}
  before_action :forbit_login_user, {only: [:new, :create, :login_form, :login]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password] )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録完了！"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def mypage
    @user = User.find_by(id: params[:id])
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      flash[:notice] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] = "編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def followings
    @user = User.find_by(id: params[:id])
    @followings = @user.followings
  end

  def followers
    @followers = @user.followers
  end

  def un_follow
    @relationships = Relationship.find_by(follower_id: @current_user.id, followed_id: params[:id])
    @relationships.destroy
    redirect_to("/users/#{params[:id]}")
  end

  def follow
    @relationships = Relationship.new(follower_id: @current_user.id, followed_id: params[:id])
    @relationships.save
    redirect_to("/users/#{params[:id]}")
  end




end
