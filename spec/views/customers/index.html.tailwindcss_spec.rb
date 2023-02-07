require "rails_helper"

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        name: "Name",
        email: "Email",
        phone: "Phone",
        state: "State"
      ),
      Customer.create!(
        name: "Name",
        email: "Email",
        phone: "Phone",
        state: "State"
      )
    ])
  end

  it "renders a list of customers" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
  end
end
