require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do

  before do
    login_admin
    allow(subject).to receive(:authenticate_user!).and_return(true)
    allow(subject).to receive(:validate_admin).and_return(true)
  end

  describe "GET #index" do
    it "assigns all categories as @products" do
      category = create(:category)
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end
end
