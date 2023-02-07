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

  describe "assign_sales_person" do
    it "assigns the given sales person to the customer" do
      office = create(:office, state: "CO")
      user = create(:user)
      office.add_sales_person(user)
      customer = create(:customer, state: "CO")
      customer.assign_sales_person!(user)

      expect(customer.sales_person).to eq user
    end

    it "replaces the sales person when called a secon time" do
      office = create(:office, state: "CO")
      customer = create(:customer, state: "CO")
      alice = create(:user, email: "alice@example.com")
      office.add_sales_person(alice)
      customer.assign_sales_person!(alice)

      expect(customer.sales_person).to eq alice

      bob = create(:user, email: "bob@example.com")
      office.add_sales_person(bob)
      customer.assign_sales_person!(bob)

      expect(customer.sales_person).to eq bob
    end

    it "raises an error if the user is invalid" do
      create(:office, state: "TX")
      office = create(:office, state: "CO")
      customer = create(:customer, state: "TX")
      user = create(:user)
      office.add_sales_person(user)

      expect { customer.assign_sales_person!(user) }.to raise_error(/cannot be assigned to customer/)
    end
  end
end
