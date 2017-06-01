require 'rails_helper'

RSpec.describe "Facilitators", type: :request do
  describe "GET /facilitators" do
    it "works! (now write some real specs)" do
      get facilitators_path
      expect(response).to have_http_status(200)
    end
  end
end
