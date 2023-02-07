require "rails_helper"

RSpec.describe Office, type: :model do
  describe "create" do
    it "successfully creates office with valid attributes" do
      office = create(:office, name: "Colorado", state: "CO")

      expect(office.name).to eq("Colorado")
      expect(office.state).to eq("CO")
    end

    it "errors with invalid state" do
      expect { create(:office, state: "XX") }.to raise_error(ActiveRecord::RecordInvalid, /is invalid/)
    end

    it "requires all fields to be present" do
      office = build(:office, name: "", state: "")

      expect(office.valid?).to be false
      expect(office.errors[:name]).to include(/blank/)
      expect(office.errors[:state]).to include(/blank/)
    end
  end
end
