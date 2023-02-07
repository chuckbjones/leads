class AddUserAssociations < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :users, :office
  end
end
