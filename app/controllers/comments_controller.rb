class CommentsController < ApplicationController
  before_action :set_blog_entry, only: :create
  before_action :set_blog_entry_comment, only: [:approve, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.assign_attributes(entry_id: @entry.id, status: "unapproved")
    @comment.save

    NoticeMailer.sendmail_confirm(@blog, @entry, @comment).deliver

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

  def set_blog_entry
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.find(params[:entry_id])
  end

  def set_blog_entry_comment
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.find(params[:entry_id])
    @comment = @entry.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:status, :body)
  end

end
