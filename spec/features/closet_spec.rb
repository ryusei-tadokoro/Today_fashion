require 'rails_helper'

RSpec.feature 'Closet Management', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category, name: 'トップス') }
  let!(:subcategory) { FactoryBot.create(:subcategory, category: category, name: 'Tシャツ') }
  let!(:closet) { FactoryBot.create(:closet, user: user, category: category, subcategory: subcategory) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'ユーザーが服を新規登録できること' do
    visit new_closet_path

    fill_in '名前', with: 'Tシャツ'
    select 'トップス', from: 'カテゴリ'
    wait_for_ajax
    select 'Tシャツ', from: 'サブカテゴリ'
    attach_file '画像', Rails.root.join('spec/fixtures/files/test_image.png')
    click_button '登録する'

    expect(page).to have_content('クローゼットの詳細')
    expect(page).to have_content('Tシャツ')
    expect(page).to have_content('トップス')
    expect(page).to have_content('Tシャツ')
  end

  scenario '無効な情報で服を登録できないこと' do
    visit new_closet_path

    fill_in '名前', with: ''
    select 'トップス', from: 'カテゴリ'
    wait_for_ajax
    select 'Tシャツ', from: 'サブカテゴリ'
    attach_file '画像', Rails.root.join('spec/fixtures/files/test_image.png')
    click_button '登録する'

    expect(page).to have_content('登録できませんでした')
  end

  scenario 'ユーザーが服を編集できること' do
    visit edit_closet_path(closet)

    fill_in '名前', with: '新しいTシャツ'
    select 'トップス', from: 'カテゴリ'
    wait_for_ajax
    select 'Tシャツ', from: 'サブカテゴリ'
    attach_file '画像', Rails.root.join('spec/fixtures/files/test_image.png')
    click_button '更新する'

    expect(page).to have_content('クローゼットの詳細')
    expect(page).to have_content('新しいTシャツ')
    expect(page).to have_content('トップス')
    expect(page).to have_content('Tシャツ')
  end

  scenario '無効な情報で服の編集が失敗すること' do
    visit edit_closet_path(closet)

    fill_in '名前', with: ''
    click_button '更新する'

    expect(page).to have_content('登録できませんでした')
  end

  scenario 'ユーザーが服を削除できること' do
    visit closet_path(closet)
    click_link '削除する'

    expect(page).to have_content('クローゼットは削除されました。')
    expect(page).not_to have_content(closet.name)
  end
end
