require 'rails_helper'

describe Blog do
  # it "titleがあれば有効な状態であること" do
  #   blog = Blog.new
  #   blog.title = "ブログタイトル"
  #   expect(blog.valid?).to be_truthy
  # end

  # it "titleがなければ無効な状態であること" do
  #   blog = Blog.new
  #   expect(blog.valid?).to be_falsey
  # end

  # 上のテストをfactory_botで書き直してみる
  before do
    @blog = build(:blog)
  end

  it "titleがあれば有効な状態であること" do
    expect(@blog.valid?).to be_truthy
  end

  it "titleがなければ無効な状態であること" do
    @blog.title = ''
    expect(@blog.valid?).to be_falsey
  end

end