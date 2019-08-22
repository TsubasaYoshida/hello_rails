require 'rails_helper'

RSpec.describe Entry, type: :model do

  before do
    @entry = build(:entry)
  end

  # it "タイトル、本文があれば有効な状態であること" do
  #   blog = Blog.create(
  #       id: 1,
  #       title: "タイトル1",
  #   )
  #   entry = Entry.new(
  #       title: "タイトル1",
  #       body: "本文1",
  #       blog_id: 1,
  #   )
  #   expect(entry).to be_valid
  # end

  it "タイトル、本文があれば有効な状態であること" do
    expect(@entry).to be_valid
  end

  # it "タイトルがなければ無効な状態であること" do
  #   entry = Entry.new(title: nil)
  #   entry.valid?
  #   expect(entry.errors[:title]).to include("can't be blank")
  # end

  it "タイトルがなければ無効な状態であること" do
    @entry.title = nil
    @entry.valid?
    expect(@entry.errors[:title]).to include("can't be blank")
  end

  # it "本文がなければ無効な状態であること" do
  #   entry = Entry.new(body: nil)
  #   entry.valid?
  #   expect(entry.errors[:body]).to include("can't be blank")
  # end

  it "本文がなければ無効な状態であること" do
    @entry.body = nil
    @entry.valid?
    expect(@entry.errors[:body]).to include("can't be blank")
  end

end
