require 'rails_helper'

RSpec.feature 'User Edit', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'ユーザーが情報を更新できること' do
    visit edit_user_registration_path

    fill_in '名前', with: 'Jane Doe'
    fill_in 'Email', with: 'jane.doe@example.com'
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password confirmation', with: 'newpassword'
    fill_in 'Current password', with: 'password'
    click_button '更新'

    expect(page).to have_content('アカウントを更新しました')
    expect(user.reload.email).to eq('jane.doe@example.com')
  end

  scenario '無効な情報で更新が失敗すること' do
    visit edit_user_registration_path

    fill_in '名前', with: ''
    fill_in 'Current password', with: 'password'
    click_button '更新'

    expect(page).to have_content('エラー')
    expect(user.reload.name).not_to eq('')
  end
end
