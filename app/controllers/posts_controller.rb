class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :can_not_change_other_posts]
  before_action :can_not_change_other_posts, except: [:new, :create, :index, :show]
  before_action :require_profile, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 12).order("created_at DESC")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = Comment.where(post_id: @post.id).paginate(:page => params[:page], :per_page => 8).order("created_at DESC")
    @comment = Comment.new
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
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js
        
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :category_ids => [])
    end

    def require_profile
      if user_signed_in? && current_user.profile == nil
        redirect_to new_profile_path, notice: "Please create a profile in order to continue."
      end
    end

    def can_not_change_other_posts
      if user_signed_in? && current_user.id != @post.user_id
        redirect_to post_path(@post), notice: "Sorry, you do not have the permission."
      end
    end
end
