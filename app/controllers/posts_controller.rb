class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update

    @post.attributes.each do |attr_name, attr_value|
      @post.attributes.attr_name = post_params[attr_name]
    end
    #@post.content = post_params['content']
    #@post.category = post_params['category']

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
