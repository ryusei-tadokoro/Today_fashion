require 'rails_helper'

RSpec.feature 'User Registration', type: :feature do
  scenario 'ユーザーが新規登録のstep1を完了してstep2に進む' do
    visit new_user_registration_path

    fill_in '名前', with: 'John Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button '次へ'

    expect(page).to have_current_path(new_user_registration_step_path(step: 'step2'))
  end

  scenario 'ユーザーが全てのステップを完了して登録される' do
    visit new_user_registration_path

    fill_in '名前', with: 'John Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button '次へ'

    attach_file 'Image', Rails.root.join('spec/fixtures/files/test_image.png')
    select '東京都', from: 'Prefecture'
    select '大阪府', from: 'Second prefecture'
    select '標準', from: 'Constitution'
    click_button 'アカウント登録'

    expect(page).to have_current_path(root_path)
    expect(User.last.email).to eq('john.doe@example.com')
  end

  scenario '無効な情報でstep1に留まる' do
    visit new_user_registration_path

    fill_in '名前', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button '次へ'

    expect(page).to have_current_path(new_user_registration_path)
  end
end
