require "rails_helper"

RSpec.describe CustomersController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/customers/new").to route_to("customers#new")
    end

    it "routes to #create" do
      expect(post: "/customers").to route_to("customers#create")
    end
  end
end
