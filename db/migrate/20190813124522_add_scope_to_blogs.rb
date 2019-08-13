class AddScopeToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :scope, :string
  end
end
