require "rails_helper"

RSpec.describe "offices/edit", type: :view do
  let(:office) {
    Office.create!(
      name: "MyString",
      state: "MyString"
    )
  }

  before(:each) do
    assign(:office, office)
  end

  it "renders the edit office form" do
    render

    assert_select "form[action=?][method=?]", office_path(office), "post" do
      assert_select "input[name=?]", "office[name]"

      assert_select "input[name=?]", "office[state]"
    end
  end
end
