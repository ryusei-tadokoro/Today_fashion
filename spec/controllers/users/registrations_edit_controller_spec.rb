# spec/controllers/users/registrations_edit_controller_spec.rb
require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe 'GET #edit' do
    it '編集ページが正常に表示されること' do
      get :edit
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context '有効なパラメータの場合' do
      let(:new_attributes) {
        { name: 'Jane Doe', email: 'jane@example.com' }
      }

      it 'ユーザー情報が更新されること' do
        put :update, params: { user: new_attributes }
        @user.reload
        expect(@user.name).to eq('Jane Doe')
        expect(@user.email).to eq('jane@example.com')
        expect(response).to redirect_to(root_path)
      end
    end

    context '無効なパラメータの場合' do
      let(:invalid_attributes) {
        { name: '', email: 'jane@example.com' }
      }

      it 'ユーザー情報が更新されないこと' do
        put :update, params: { user: invalid_attributes }
        @user.reload
        expect(@user.name).not_to eq('')
        expect(response).to render_template('edit')
      end
    end
  end
end

