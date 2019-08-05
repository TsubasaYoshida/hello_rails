class EntriesController < ApplicationController
  before_action :set_blog_entry, only: [:show, :edit, :update, :destroy]
  before_action :set_blog, only: [:new, :create]

  def show
    @comment = Comment.new
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.assign_attributes(blog_id: @blog.id)
    if @entry.save
      redirect_to blog_entry_url(@blog, @entry)
    else
      render :new
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to blog_entry_url(@blog, @entry)
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to blog_url(@blog)
  end

  private

  def set_blog_entry
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.find(params[:id])
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def entry_params
    params.require(:entry).permit(:title, :body)
  end

end
