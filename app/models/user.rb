class User < ApplicationRecord
  rolify

  # Just doing the bare minimum for devise here for testing purposes.
  # Create a User in the rails console using the helper method below
  devise :database_authenticatable, :validatable, :timeoutable

  has_many :customers, inverse_of: :sales_person
end
