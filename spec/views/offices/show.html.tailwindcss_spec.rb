require "rails_helper"

RSpec.describe "offices/show", type: :view do
  before(:each) do
    assign(:office, Office.create!(
      name: "Name",
      state: "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/State/)
  end
end
