require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #show:get" do
    it "returns http success" do
      get :show:get
      expect(response).to have_http_status(:success)
    end
  end

end
