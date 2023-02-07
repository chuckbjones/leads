require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "create" do
    it "automatically assigns office on create" do
      office = create(:office, state: "CO")
      customer = create(:customer, state: "CO")

      expect(customer.office).to eq(office)
    end

    it "errors with invalid state" do
      create(:office, state: "TX")
      expect { create(:customer, state: "CO") }.to raise_error(ActiveRecord::RecordInvalid, /Office must exist/)
    end

    it "requires all fields to be present" do
      customer = build(:customer, name: "", email: "", phone: "", state: "")
      expect(customer.valid?).to be false
      expect(customer.errors[:name]).to include(/blank/)
      expect(customer.errors[:email]).to include(/blank/)
      expect(customer.errors[:phone]).to include(/blank/)
      expect(customer.errors[:state]).to include(/blank/)
    end
  end
end
