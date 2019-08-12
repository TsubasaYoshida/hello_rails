class AddColumns2ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :confirmed_at, :datetime
  end
end
