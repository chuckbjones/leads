# Users represent Employees in an Office.
# A User with the role of :sales can have many associated Customers that are
# also associated to the same office. The Customers will be manually assigned
# by a User in the same Office with the :manager role.
# An :admin Role also exists, but is reserved for debugging purposes at the moment
# and may be removed in the future.
class User < ApplicationRecord
  rolify

  # Just doing the bare minimum for devise here for testing purposes.
  # Some test users can be created via rake db:seed in the dev env.
  devise :database_authenticatable, :validatable, :timeoutable

  belongs_to :office, optional: true
  has_many :customers, inverse_of: :sales_person
end
