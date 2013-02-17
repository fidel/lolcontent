class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_post, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json
  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.posts
    respond_with(@posts)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    redirect_to @post, status: :moved_permamently if request.path != post_path(@post)
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_user.posts.build
    respond_with(@post)
  end

  # GET /posts/1/edit
  def edit
    respond_with(@post)
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(params[:post])
    flash[:notice] = 'Post was successfully created.' if @post.save
    respond_with(@post)
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    flash[:notice] = 'Post was successfully updated.' if @post.update_attributes(params[:post])
    respond_with(@post)
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_with(@post)
  end

  private

  def find_post
    @post = current_user.posts.find(params[:id])
  end
end
