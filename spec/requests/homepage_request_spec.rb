require 'rails_helper'

RSpec.describe "Homepage", type: :request do

  describe "Request - GET /" do
    it "returns http success(200)" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

end