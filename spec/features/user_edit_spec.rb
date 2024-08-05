# spec/features/user_edit_spec.rb
require 'rails_helper'

RSpec.feature 'User Edit', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, scope: :user)
    visit edit_user_registration_path
  end

  scenario 'ユーザーが情報を更新できること' do
    fill_in '名前', with: 'Jane Doe'
    fill_in 'メールアドレス', with: 'jane@example.com'
    click_button '更新'

    expect(page).to have_current_path(root_path)
    expect(page).to have_content('アカウントを更新しました.')
  end

  scenario '無効な情報で更新が失敗すること' do
    fill_in '名前', with: ''
    click_button '更新'

    expect(page).to have_current_path(user_registration_path)
    expect(page).to have_content('名前を入力してください')
  end
end
