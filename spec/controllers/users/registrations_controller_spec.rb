# spec/controllers/users/registrations_controller_spec.rb
require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'GET #new' do
    it '新規登録ページが正常に表示されること' do
      get :new, params: { step: 'step1' }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context '有効なパラメータの場合（step1）' do
      let(:valid_attributes_step1) {
        { name: 'John Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password' }
      }

      let(:valid_session) { { user_params: valid_attributes_step1 } }

      it 'ユーザーがstep2に進むこと' do
        post :create, params: { user: valid_attributes_step1, step: 'step1' }, session: valid_session
        expect(response).to redirect_to(new_user_registration_step_path(step: 'step2'))
      end

      it 'ユーザーがstep2を完了して登録されること' do
        post :create, params: { user: valid_attributes_step1, step: 'step1' }, session: valid_session

        post :create, params: { step: 'step2' }, session: valid_session
        expect(response).to redirect_to(root_path)
        expect(controller.current_user).to be_present
      end
    end

    context '無効なパラメータの場合（step1）' do
      let(:invalid_attributes_step1) {
        { name: '', email: 'john@example.com', password: 'password', password_confirmation: 'password' }
      }

      it 'ユーザーがstep1に留まること' do
        post :create, params: { user: invalid_attributes_step1, step: 'step1' }
        expect(response).to render_template('users/registrations/step1')
      end
    end
  end
end
