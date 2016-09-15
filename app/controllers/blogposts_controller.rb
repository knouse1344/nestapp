class BlogpostsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :new, :update, :destroy]
  before_action :set_blogpost, only: [:show, :edit, :update, :destroy]

  # GET /blogposts
  def index
    @galleries = Blogpost.all
  end

  # GET /blogposts/1
  # GET /blogposts/1.json
  def show
  end

  # GET /blogposts/new
  def new
    @blogpost = Blogpost.new
  end

  # GET /blogposts/1/edit
  def edit
  end

  # POST /blogpost
  # POST /blogpost.json
  def create
    @blogpost = Blogpost.new(blogpost_params)

    respond_to do |format|
      if @blogpost.save
        format.html { redirect_to '/', notice: 'New blog successfully added.' }
        format.json { render action: 'show', status: :created, location: @blogpost }
      else
        format.html { render action: 'new' }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogpost/1
  # PATCH/PUT /blogpost/1.json
  def update
    respond_to do |format|
      if @blogpost.update(blogpost_params)
        format.html { redirect_to '/', notice: 'Blog successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogpost/1
  # DELETE /blogpost/1.json
  def destroy
    @blogpost.destroy
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogpost
      @blogpost = Blogpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blogpost_params
      params.require(:blogpost).permit(:name, :body)
    end
end
