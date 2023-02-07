class AddAssociationsToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :customers, :office
    add_belongs_to :customers, :user
  end
end
