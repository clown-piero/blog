class BlogtextsController < ApplicationController
  before_action :authenticate_user

  def new
    @blogtext = Blogtext.new
  end

  def create
    @blogtext = Blogtext.new(title: params[:title], content: params[:content], user_id: @current_user.id)
    if @blogtext.save
      flash[:notice] = "投稿しました"
      redirect_to("/blogtexts/show")
    else
      render("blogtexts/new")
    end
  end

  def show
    @blogtexts = Blogtext.all.order(created_at: :desc)
  end

  def details
    @blogtext = Blogtext.find_by(id: params[:id])
    @user = User.find_by(id: @blogtext.user_id)
  end

end
