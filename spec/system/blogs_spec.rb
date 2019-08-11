require 'rails_helper'

RSpec.describe 'Blog管理', type: :system do
  scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
    # 一覧画面に遷移する
    visit blogs_path
    # 'New Blog'リンクをクリックする
    click_link 'New Blog'
    # 何も入力せずに'Save'ボタンをクリックする
    click_button 'Save'

    # "Title can't be blank"のエラーメッセージが表示されること
    expect(page).to have_content "Title can't be blank"
  end


  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do
    visit blogs_path
    click_link 'New Blog'
    # Titleテキストボックスに'title'と入力する
    fill_in 'Title', with: 'title'

    # 'Save'ボタンをクリックすると、ブログテーブルのレコードが1増える
    expect {
      click_button 'Save'
    }.to change(Blog, :count).by(1)
    # 詳細画面に遷移すること
    expect(current_path).to eq blog_path(Blog.first)
    # "Blog was successfully created."のメッセージが表示されること
    expect(page).to have_content 'Blog was successfully created.'
  end

end