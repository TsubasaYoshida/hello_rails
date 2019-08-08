class Entry < ApplicationRecord
  has_many :comments
  belongs_to :blog

  validates :title, :body,
            presence: true

  def self.entries_having_unapproved_comment
    comments = Comment.where(status: "unapproved")
    entries = []
    comments.each do |comment|
      entries << comment.entry
    end
    entries
  end

end
