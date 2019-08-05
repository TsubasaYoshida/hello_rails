class CommentsController < ApplicationController
  before_action :set_blog_entry, only: [:create, :approve, :destroy]
  before_action :set_comment, only: [:approve, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.assign_attributes(entry_id: @entry.id, status: "unapproved")
    @comment.save
    redirect_to blog_entry_url(@blog, @entry)
  end

  def destroy
    @comment.destroy
    redirect_to blog_entry_url(@blog, @entry)
  end

  def approve
    @comment.update(status: "approved")
    redirect_to blog_entry_url(@blog, @entry)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_blog_entry
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.find(params[:entry_id])
  end

  def comment_params
    params.require(:comment).permit(:status, :body)
  end

end
