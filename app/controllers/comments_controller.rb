class CommentsController < ApplicationController
  def approve
    @comment = Comment.find(params[:id])
    @comment.update(status: "approved")
    @entry = @comment.entry
    redirect_to blog_entry_url(@entry.blog, @entry)
  end
end
