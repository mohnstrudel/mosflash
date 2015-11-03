require 'rails_helper'

RSpec.describe DownloadsController, type: :controller do

  describe "GET #exe" do
    it "returns http success" do
      get :exe
      expect(response).to have_http_status(:success)
    end
  end

end
