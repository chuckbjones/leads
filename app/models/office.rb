class Office < ApplicationRecord
  resourcify

  validates :name, presence: true
  validates :state, presence: true, us_state: true

  has_many :customers
end
