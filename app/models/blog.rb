class Blog < ApplicationRecord
  has_many :entries

  def self.blog_have_no_entry
    all_blog = Blog.all
    ret = []
    all_blog.each do |blog|
      ret << blog if blog.entries.count == 0
    end
    ret
  end

end
