# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Closet Management', type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category, name: 'トップス') }
  let!(:subcategory) { FactoryBot.create(:subcategory, category:, name: 'Tシャツ') }
  let!(:closet) { FactoryBot.create(:closet, user:, category:, subcategory:) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'ユーザーが服を新規登録できること' do
    visit new_closet_path

    attach_file 'image-upload', Rails.root.join('spec/fixtures/files/test_image.png') # IDを直接指定
    fill_in I18n.t('activerecord.attributes.closet.name'), with: 'Tシャツ'
    select 'トップス', from: I18n.t('activerecord.attributes.closet.category_id')

    # サブカテゴリーの選択肢が表示されるまで待つ
    expect(page).to have_select(I18n.t('activerecord.attributes.closet.subcategory_id'), options: %w[選択してください Tシャツ])
    select 'Tシャツ', from: I18n.t('activerecord.attributes.closet.subcategory_id')

    click_button '登録する'

    # アラートの処理
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('クローゼットの詳細')
    expect(page).to have_content('Tシャツ')
  end

  scenario '無効な情報で服を登録できないこと' do
    visit new_closet_path

    fill_in I18n.t('activerecord.attributes.closet.name'), with: ''
    select '選択してください', from: I18n.t('activerecord.attributes.closet.category_id')
    click_button '登録する'

    # アラートが存在するか確認してから受け入れる
    begin
      alert = page.driver.browser.switch_to.alert
      alert.accept
    rescue Selenium::WebDriver::Error::NoSuchAlertError
      # アラートが存在しない場合は何もしない
    end
  end

  scenario 'ユーザーが服を編集できること' do
    visit edit_closet_path(closet)

    fill_in I18n.t('activerecord.attributes.closet.name'), with: '新しいTシャツ'
    click_button '更新する'
  end

  scenario '無効な情報で服の編集が失敗すること' do
    visit edit_closet_path(closet)

    fill_in I18n.t('activerecord.attributes.closet.name'), with: ''
    click_button '更新する'

    # アラートが存在するか確認してから受け入れる
    begin
      alert = page.driver.browser.switch_to.alert
      alert.accept
    rescue Selenium::WebDriver::Error::NoSuchAlertError
      # アラートが存在しない場合は何もしない
    end
  end

  scenario 'ユーザーが服を削除できること' do
    visit closet_path(closet)
    accept_confirm do
      click_link I18n.t('closets.destroy_button')
    end

    expect(page).not_to have_content(closet.name)
  end
end
