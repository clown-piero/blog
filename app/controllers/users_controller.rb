class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password] )
    if @user.save
      flash[:notice] = "ユーザー登録完了！"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def mypage
    @user = User.find_by(id: params[:id])
  end

end
