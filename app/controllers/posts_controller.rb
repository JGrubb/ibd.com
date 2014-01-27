class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :require_user, only: [:new, :create, :edit, :update, :delete, :unpublished]
  before_action :verify_published, only: :show

  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.all.to_ary.sort { |a, b| b.created_at <=> a.created_at }
    @posts = Post.where(published: true).order('created_at DESC').limit(5)
  end

  def search
    @posts = Post.basic_search(params[:q])
    render :index
  end

  def archive
    @posts = Post.pub_and_sorted.reverse
  end

  def unpublished
    @posts = Post.where(published: false)
    render :index
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    posts = Post.published.reverse_sorted

    @title = @post.title
    @summary = @post.summary.blank? ? @post.body : @post.summary

    @previous = posts.select { |p| p.created_at < @post.created_at }.first
    @next = posts.select { |p| p.created_at > @post.created_at }.reverse.first
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_date_path(@post.year, @post.month, @post.slug), notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_date_path(@post.year, @post.month, @post.slug), notice: 'Post was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def verify_published
      unless @post.published? || require_user
        redirect_to :posts_index_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :summary, :published)
    end
end
