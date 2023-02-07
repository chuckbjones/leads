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

  describe "add_manager" do
    it "adds a new user to the office with manager role" do
      office = create(:office, name: "Colorado", state: "CO")
      user = create(:user)
      office.add_manager(user)
      office.reload
      expect(office.users).to include(user)
      expect(user.has_role?(:manager, office)).to be true
    end
  end

  describe "add_sales_person" do
    it "adds a new user to the office with sales_person role" do
      office = create(:office, name: "Colorado", state: "CO")
      user = create(:user)
      office.add_sales_person(user)
      office.reload
      expect(office.users).to include(user)
      expect(user.has_role?(:sales, office)).to be true
    end
  end

  describe "managers" do
    it "lists the managers for an office" do
      office = create(:office, name: "Colorado", state: "CO")
      office.add_manager(create(:user, email: "alice@example.com"))
      office.add_manager(create(:user, email: "bob@example.com"))
      office.reload
      expect(office.managers.count).to eq(2)
    end

    it "lists the managers for an office and omits all other users" do
      office = create(:office, name: "Colorado", state: "CO")
      office.add_manager(create(:user, email: "alice@example.com"))
      office.add_sales_person(create(:user, email: "bob@example.com"))
      office.reload
      expect(office.managers.count).to eq(1)
    end
  end

  describe "sales_people" do
    it "lists the sales_people for an office" do
      office = create(:office, name: "Colorado", state: "CO")
      office.add_sales_person(create(:user, email: "alice@example.com"))
      office.add_sales_person(create(:user, email: "bob@example.com"))
      office.reload
      expect(office.sales_people.count).to eq(2)
    end

    it "lists the sales_people for an office and omits all other users" do
      office = create(:office, name: "Colorado", state: "CO")
      office.add_manager(create(:user, email: "alice@example.com"))
      office.add_sales_person(create(:user, email: "bob@example.com"))
      office.reload
      expect(office.sales_people.count).to eq(1)
    end
  end
end
