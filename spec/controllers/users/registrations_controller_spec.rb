require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context '有効なパラメータの場合（step1）' do
      it 'ユーザーがstep2を完了して登録されること' do
        session[:user_params] = {
          name: 'John Doe',
          email: 'john.doe@example.com',
          password: 'password',
          password_confirmation: 'password'
        }
        post :create,
             params: { step: 'step1',
                       user: { name: 'John Doe', email: 'john.doe@example.com', password: 'password',
                               password_confirmation: 'password' } }
        expect(response).to redirect_to(new_user_registration_step_path(step: 'step2'))

        session[:user_params].merge!(
          prefecture_id: 13,
          second_prefecture_id: 27,
          constitution_id: 3
        )
        post :create,
             params: { step: 'step2', user: { prefecture_id: 13, second_prefecture_id: 27, constitution_id: 3 } }
        expect(response).to redirect_to(root_path)
        user = User.find_by(email: 'john.doe@example.com')
        expect(user).not_to be_nil
        expect(user.prefecture_id).to eq(13)
        expect(user.second_prefecture_id).to eq(27)
        expect(user.constitution_id).to eq(3)
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
        post :create, params: { step: 'step1', user: { name: '', email: '', password: '', password_confirmation: '' } }
        expect(response).to render_template('users/registrations/step1')
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
        put :update, params: { user: { email: 'invalid' } } # 無効なパラメータを渡す
        expect(response).to render_template(:edit)
        @user.reload
        expect(@user.email).not_to eq('invalid')
      end
    end
  end
end
