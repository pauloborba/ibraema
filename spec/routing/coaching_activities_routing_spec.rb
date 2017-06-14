require "rails_helper"

RSpec.describe CoachingActivitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/coaching_activities").to route_to("coaching_activities#index")
    end

    it "routes to #new" do
      expect(:get => "/coaching_activities/new").to route_to("coaching_activities#new")
    end

    it "routes to #show" do
      expect(:get => "/coaching_activities/1").to route_to("coaching_activities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/coaching_activities/1/edit").to route_to("coaching_activities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/coaching_activities").to route_to("coaching_activities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/coaching_activities/1").to route_to("coaching_activities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/coaching_activities/1").to route_to("coaching_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/coaching_activities/1").to route_to("coaching_activities#destroy", :id => "1")
    end

  end
end
