# spec/controllers/closets_controller_spec.rb
require 'rails_helper'

RSpec.describe ClosetsController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:closet).merge(user_id: user.id) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      closet = create(:closet, user: user)
      get :show, params: { id: closet.to_param }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      closet = create(:closet, user: user)
      get :edit, params: { id: closet.to_param }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Closet" do
        expect {
          post :create, params: { closet: valid_attributes }
        }.to change(Closet, :count).by(1)
      end
    end
  end

  describe "PATCH/PUT #update" do
    context "with valid params" do
      it "updates the requested closet" do
        closet = create(:closet, user: user)
        new_attributes = { name: "Updated Closet" }
        patch :update, params: { id: closet.to_param, closet: new_attributes }
        closet.reload
        expect(closet.name).to eq("Updated Closet")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested closet" do
      closet = create(:closet, user: user)
      expect {
        delete :destroy, params: { id: closet.to_param }
      }.to change(Closet, :count).by(-1)
    end
  end
end
