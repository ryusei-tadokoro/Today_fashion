# spec/features/user_registration_spec.rb
require 'rails_helper'

RSpec.feature 'User Registration', type: :feature do
  scenario 'ユーザーが新規登録のstep1を完了してstep2に進む' do
    visit new_user_registration_step_path(step: 'step1')

    fill_in '名前', with: 'John Doe'
    fill_in 'メールアドレス', with: 'john@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'
    click_button '次へ'

    expect(page).to have_current_path(new_user_registration_step_path(step: 'step2'))
  end

  scenario 'ユーザーが全てのステップを完了して登録される' do
    visit new_user_registration_step_path(step: 'step1')

    fill_in '名前', with: 'John Doe'
    fill_in 'メールアドレス', with: 'john@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'
    click_button '次へ'

    # ステップ2
    select '東京都', from: 'user_prefecture_id'
    select '東京都', from: 'user_second_prefecture_id'
    select 'やや暑がり', from: 'user_constitution_id'
    attach_file 'user_image', Rails.root.join('spec/fixtures/files/test_image.png')
    click_button 'アカウント登録'

    expect(page).to have_current_path(root_path)
    expect(User.last.email).to eq('john@example.com')
  end

  scenario '無効な情報でstep1に留まる' do
    visit new_user_registration_step_path(step: 'step1')

    fill_in '名前', with: ''
    fill_in 'メールアドレス', with: 'john@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'
    click_button '次へ'

    expect(page).to have_current_path(new_user_registration_step_path(step: 'step1'))
    expect(page).to have_content('名前を入力してください')
  end
end
