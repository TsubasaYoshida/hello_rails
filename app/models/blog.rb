class Blog < ApplicationRecord
  has_many :entries

  def self.blog_have_no_entry
    ret = []
    Blog.all.each do |blog|
      ret << blog if blog.entries.count == 0
    end
    ret
  end

end
