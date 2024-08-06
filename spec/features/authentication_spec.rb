# spec/features/authentication_spec.rb
require 'rails_helper'

RSpec.feature 'User Authentication', type: :feature do
  let(:user) { create(:user) }

  scenario 'ユーザーがホームページからログインできること' do
    visit root_path

    click_link 'Login'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'

    expect(page).to have_content('ログインしました')
  end

  scenario 'ユーザーがログアウトできること' do
    login_as(user, scope: :user)
    visit root_path

    click_link 'ログアウト'
  end
end
