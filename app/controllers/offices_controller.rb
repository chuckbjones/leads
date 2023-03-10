class OfficesController < ApplicationController
  before_action :authenticate_user!, except: %i[home]
  before_action :set_office, only: %i[home show edit update]
  before_action :authorize_for_office, only: %i[home show edit update]

  # GET /offices/1/home
  def home
  end

  # GET /offices/1 or /offices/1.json
  def show
  end

  # GET /offices/1/edit
  def edit
  end

  # PATCH/PUT /offices/1 or /offices/1.json
  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to office_url(@office), notice: "Office was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_office
    @office = Office.find(params[:id])
  end

  def authorize_for_office
    authorize @office
  end

  # Only allow a list of trusted parameters through.
  def office_params
    params.require(:office).permit(:name, :state)
  end
end
