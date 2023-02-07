require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/customers", type: :request do
  before(:each) do
    create(:office, state: "CO")
  end

  # This should return the minimal set of attributes required to create a valid
  # Customer. As you add validations to Customer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:customer, state: "CO")
  }

  let(:invalid_attributes) {
    attributes_for(:customer, state: "XX")
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_customer_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Customer" do
        expect {
          post customers_url, params: {customer: valid_attributes}
        }.to change(Customer, :count).by(1)
      end

      it "redirects to the office url" do
        post customers_url, params: {customer: valid_attributes}
        expect(response).to redirect_to(%r{/offices/\d+/home})
      end
    end

    context "with invalid parameters" do
      it "does not create a new Customer" do
        expect {
          post customers_url, params: {customer: invalid_attributes}
        }.to change(Customer, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post customers_url, params: {customer: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
