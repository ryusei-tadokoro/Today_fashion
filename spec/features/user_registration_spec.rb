require 'rails_helper'

RSpec.feature "User Registration", type: :feature do
  let(:user) { build(:user) }

  scenario "ユーザーが新規登録のstep1を完了してstep2に進む" do
    visit new_user_registration_step_path(step: 'step1')
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_button '次へ'

    expect(page).to have_current_path(new_user_registration_step_path(step: 'step2'))
  end

  scenario "ユーザーが全てのステップを完了して登録される" do
    visit new_user_registration_step_path(step: 'step1')
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_button '次へ'

    expect(page).to have_current_path(new_user_registration_step_path(step: 'step2'))

    attach_file('user[image]', Rails.root.join('spec/fixtures/files/test_image.png'))
    select '東京都', from: 'user[prefecture_id]'
    select '大阪府', from: 'user[second_prefecture_id]'
    select 'やや寒がり', from: 'user[constitution_id]'
    click_button 'アカウント登録'

    expect(page).to have_content('アカウント登録完了しました。さあ！始めよう!!')
  end

  scenario "無効な情報でstep1に留まる" do
    visit new_user_registration_step_path(step: 'step1')
    fill_in 'user[name]', with: ''
    fill_in 'user[email]', with: ''
    fill_in 'user[password]', with: ''
    fill_in 'user[password_confirmation]', with: ''
    click_button '次へ'

    expect(page).to have_content('エラーが発生したため ユーザー は保存されませんでした')
  end
end
