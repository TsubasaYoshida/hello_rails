require 'rails_helper'

RSpec.describe Entry, type: :model do

  it "タイトル、本文があれば有効な状態であること" do
    blog = Blog.create(
        id: 1,
        title: "タイトル1",
        )
    entry = Entry.new(
        title: "タイトル1",
        body: "本文1",
        blog_id: 1,
    )
    expect(entry).to be_valid
  end

end
