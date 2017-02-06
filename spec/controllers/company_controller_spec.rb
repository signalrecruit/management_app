require 'rails_helper'

RSpec.describe CompanyController, type: :controller do

  describe "GET #company_dashboard" do
    it "returns http success" do
      get :company_dashboard
      expect(response).to have_http_status(:success)
    end
  end

end
