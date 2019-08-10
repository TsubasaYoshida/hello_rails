require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "本文、ステータスがあれば有効な状態であること" do
    Blog.create(
        id: 1,
        title: "タイトル1",
    )
    Entry.create(
        id: 1,
        title: "タイトル1",
        body: "本文1",
        blog_id: 1,
    )
    comment = Comment.new(
        body: "本文1",
        status: "unapproved",
        entry_id: 1,
    )
    expect(comment).to be_valid
  end

  it "本文がなければ無効な状態であること" do
    comment = Comment.new(body: nil)
    comment.valid?
    expect(comment.errors[:body]).to include("can't be blank")
  end

  it "ステータスがなければ無効な状態であること" do
    comment = Comment.new(status: nil)
    comment.valid?
    expect(comment.errors[:status]).to include("can't be blank")
  end

end
