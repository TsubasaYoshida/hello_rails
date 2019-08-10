class Comment < ApplicationRecord
  belongs_to :entry

  validates :body, :status,
            presence: true

  def self.comments_related_blog_1
    comments = []
    Blog.find_by(id: 1).entries.each do |entry|
      entry.comments.each do |comment|
        comments << comment
      end
    end
    comments
  end

end
