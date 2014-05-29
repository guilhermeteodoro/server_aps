class ExternalPostsController < ApplicationController
  before_action :set_external_post, only: [:show, :edit, :update, :destroy]

  def index
    @external_posts = ExternalPost.all
  end

  def show
  end

  def new
    @external_post = ExternalPost.new
  end

  def edit
  end

  def create
    @external_post = ExternalPost.new(external_post_params)

    respond_to do |format|
      if @external_post.save
        format.html { redirect_to @external_post, notice: 'Post criado.' }
        format.json { render action: 'show', status: :created, location: @external_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @external_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @external_post.update(external_post_params)
        format.html { redirect_to @external_post, notice: 'Post atualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @external_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @external_post.destroy
    respond_to do |format|
      format.html { redirect_to external_posts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_external_post
      @external_post = ExternalPost.find(params[:id])
    end

    def external_post_params
      params.require(:external_post).permit(:title, :body, :published)
    end
end
