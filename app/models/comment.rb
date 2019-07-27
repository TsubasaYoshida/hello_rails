class Comment < ApplicationRecord
  belongs_to :entry

  def self.comments_related_blog_1
    entries = Entry.where(blog_id: 1)
    comments = []
    entries.each do |entry|
      comments_narrowed_by_entry = Comment.where(entry_id: entry.id)
      comments_narrowed_by_entry.each do |comment|
        comments << comment
      end
    end
    comments
  end

end
