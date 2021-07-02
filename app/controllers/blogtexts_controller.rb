class BlogtextsController < ApplicationController
  def new
    @blogtext = Blogtext.new
  end

  def create
    @blogtext = Blogtext.new(title: params[:title], content: params[:content])
    if @blogtext.save
      flash[:notice] = "投稿しました"
      redirect_to("/blogtexts/show")
    else
      render("blogtexts/new")
    end
  end
end
