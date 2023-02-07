class CustomersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]

  # GET /customers/new
  def new
    @customer = Customer.new
    authorize @customer
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)
    authorize @customer
    respond_to do |format|
      if @customer.save
        format.html { redirect_to office_home_path(@customer.office), notice: "Thank you for your interest in our services. Someone from our local office will be contacting you shortly." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :state)
  end
end
