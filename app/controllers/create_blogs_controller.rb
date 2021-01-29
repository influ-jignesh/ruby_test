class CreateBlogsController < ApplicationController
  before_action :set_create_blog, only: %i[ show edit update destroy ]

  # GET /create_blogs or /create_blogs.json
  def index
    @create_blogs = CreateBlog.all
  end

  # GET /create_blogs/1 or /create_blogs/1.json
  def show
  end

  # GET /create_blogs/new
  def new
    @create_blog = CreateBlog.new
  end

  # GET /create_blogs/1/edit
  def edit
  end

  # POST /create_blogs or /create_blogs.json
  def create
    @create_blog = CreateBlog.new(create_blog_params)

    respond_to do |format|
      if @create_blog.save
        format.html { redirect_to @create_blog, notice: "Create blog was successfully created." }
        format.json { render :show, status: :created, location: @create_blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @create_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_blogs/1 or /create_blogs/1.json
  def update
    respond_to do |format|
      if @create_blog.update(create_blog_params)
        format.html { redirect_to @create_blog, notice: "Create blog was successfully updated." }
        format.json { render :show, status: :ok, location: @create_blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @create_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_blogs/1 or /create_blogs/1.json
  def destroy
    @create_blog.destroy
    respond_to do |format|
      format.html { redirect_to create_blogs_url, notice: "Create blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_blog
      @create_blog = CreateBlog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_blog_params
      params.fetch(:create_blog, {})
    end
end
