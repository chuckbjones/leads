# An Office represents the Customers and Employees (Users) for a single US state.
# Employees may be Managers or Sales People, depending on their Role. While in
# reality, there will likely be just a single manager to an office, nothing technically
# prevents there from being multiple.
class Office < ApplicationRecord
  resourcify

  validates :name, presence: true
  validates :state, presence: true, us_state: true

  has_many :users
  has_many :customers

  # QUESTION: can a user have more than 1 role?
  # probably not. We should remove one if we add another.
  # Seems like checking for that sort of thing would call for some kind of Policy object... hmmm.
  def add_manager(user)
    users << user
    user.add_role(:manager, self)
  end

  def add_sales_person(user)
    users << user
    user.add_role(:sales, self)
  end

  # HACK: assuming the first manager found is the primary manager
  def manager
    users.find { |u| u.has_role?(:manager, self) }
  end

  def managers
    users.select { |u| u.has_role?(:manager, self) }
  end

  def sales_people
    users.select { |u| u.has_role?(:sales, self) }
  end
end
