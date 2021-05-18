require 'rails_helper'

RSpec.describe "Homepage", type: :request do

  describe "Request - GET /" do
    it "returns http redirect(302) - not signed in" do
      get root_path
      expect(response).to have_http_status(:redirect)
    end
  end

end