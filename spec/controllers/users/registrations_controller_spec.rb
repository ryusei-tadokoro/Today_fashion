require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe 'POST #create' do
    context '有効なパラメータの場合（step1）' do
      it 'ユーザーがstep2を完了して登録されること' do
        session[:user_params] = {
          name: 'John Doe',
          email: 'john.doe@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
        post :create, params: { step: 'step2', user: { prefecture_id: 13, second_prefecture_id: 27, constitution_id: 3 } }
        expect(response).to redirect_to(root_path)
        expect(User.last.name).to eq('John Doe')
      end
    end

    context '無効なパラメータの場合（step1）' do
      it 'ユーザーがstep1に留まること' do
        session[:user_params] = {
          name: '',
          email: '',
          password: '',
          password_confirmation: ''
        }
        post :create, params: { step: 'step1', user: { prefecture_id: '', second_prefecture_id: '', constitution_id: '' } }
        expect(response).to render_template("users/registrations/step1")
      end
    end
  end

  describe 'PUT #update' do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    context '有効なパラメータの場合' do
      it 'ユーザー情報が更新されること' do
        put :update, params: { user: { name: 'New Name' } }
        expect(response).to redirect_to(root_path)
        @user.reload
        expect(@user.name).to eq('New Name')
      end
    end

    context '無効なパラメータの場合' do
      it 'ユーザー情報が更新されないこと' do
        put :update, params: { user: { name: '' } }
        expect(response).to render_template(:edit)
        @user.reload
        expect(@user.name).not_to eq('')
      end
    end
  end
end
