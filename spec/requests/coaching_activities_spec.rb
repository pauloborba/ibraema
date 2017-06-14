require 'rails_helper'

RSpec.describe "CoachingActivities", type: :request do
  describe "GET /coaching_activities" do
    it "works! (now write some real specs)" do
      get coaching_activities_path
      expect(response).to have_http_status(200)
    end
  end
end
