class BlogcontentsController < ApplicationController
  before_action :set_blogcontent, only: %i[ show edit update destroy ]

  # GET /blogcontents or /blogcontents.json
  def index
    @blogcontents = Blogcontent.all
  end

  # GET /blogcontents/1 or /blogcontents/1.json
  def show
  end

  # GET /blogcontents/new
  def new
    @blogcontent = Blogcontent.new
  end

  # GET /blogcontents/1/edit
  def edit
  end

  # POST /blogcontents or /blogcontents.json
  def create
    @blogcontent = Blogcontent.new(blogcontent_params)

    respond_to do |format|
      if @blogcontent.save
        format.html { redirect_to @blogcontent, notice: "Blogcontent was successfully created." }
        format.json { render :show, status: :created, location: @blogcontent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blogcontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogcontents/1 or /blogcontents/1.json
  def update
    respond_to do |format|
      if @blogcontent.update(blogcontent_params)
        format.html { redirect_to @blogcontent, notice: "Blogcontent was successfully updated." }
        format.json { render :show, status: :ok, location: @blogcontent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blogcontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogcontents/1 or /blogcontents/1.json
  def destroy
    @blogcontent.destroy
    respond_to do |format|
      format.html { redirect_to blogcontents_url, notice: "Blogcontent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogcontent
      @blogcontent = Blogcontent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blogcontent_params
      params.require(:blogcontent).permit(:content, :user_id)
    end
end
