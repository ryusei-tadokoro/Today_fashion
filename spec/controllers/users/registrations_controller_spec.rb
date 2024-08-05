# spec/controllers/users/registrations_controller_spec.rb
require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context '有効なパラメータの場合（step1）' do
      let(:valid_attributes) {
        { name: 'John Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password' }
      }

      it 'ユーザーがstep2を完了して登録されること' do
        post :create, params: { user: valid_attributes, step: 'step1' }
        expect(response).to redirect_to(new_user_registration_step_path(step: 'step2'))

        # セッションを初期化
        session[:user_params] = valid_attributes

        post :create, params: { user: { prefecture_id: 1, constitution_id: 1 }, step: 'step2' }
        expect(response).to redirect_to(root_path)
      end
    end

    context '無効なパラメータの場合（step1）' do
      let(:invalid_attributes) {
        { name: '', email: 'john@example.com', password: 'password', password_confirmation: 'password' }
      }

      it 'ユーザーがstep1に留まること' do
        post :create, params: { user: invalid_attributes, step: 'step1' }
        expect(response).to render_template("users/registrations/step1")
      end
    end
  end
end
