class Blog < ApplicationRecord
  has_many :entries

  def self.blog_have_no_entry
    blog_list = []
    Blog.all.each do |blog|
      blog_list << blog if blog.entries.count == 0
    end
    blog_list
  end

  def self.blog_having_entry_having_unapproved_comment
    blog_list = []
    Entry.entries_having_unapproved_comment.each do |entry|
      blog_list << entry.blog
    end
    blog_list
  end

end
