require "rails_helper"

RSpec.describe "offices/index", type: :view do
  before(:each) do
    assign(:offices, [
      Office.create!(
        name: "Name",
        state: "State"
      ),
      Office.create!(
        name: "Name",
        state: "State"
      )
    ])
  end

  it "renders a list of offices" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
  end
end
