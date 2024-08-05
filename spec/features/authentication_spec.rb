# spec/features/authentication_spec.rb
require 'rails_helper'

RSpec.feature 'User Authentication', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'ユーザーがホームページからログインできること' do
    visit root_path

    click_link 'Login'

    expect(page).to have_current_path(new_user_session_path)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_current_path(authenticated_root_path)
    expect(page).to have_content('ログインしました')
  end

  scenario 'ユーザーがログアウトできること' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_current_path(authenticated_root_path)
    expect(page).to have_content('ログインしました')

    find('.navbar-toggler').click
    click_link 'ログアウト'

    expect(page).to have_current_path(root_path)
    expect(page).to have_content('ログアウトしました')
  end
end
