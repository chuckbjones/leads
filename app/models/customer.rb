class Customer < ApplicationRecord
  belongs_to :office
  belongs_to :sales_person, optional: true, class_name: "User", foreign_key: "user_id"

  validates :name, presence: true

  # TODO: I used to have a nice gem for validating emails. valid_email2 I believe.
  # Does devise have an email validator we can steal?
  validates :email, presence: true

  # TODO: There's probably something similar for phones. International support adds a few wrinkles.
  validates :phone, presence: true

  # TODO: Again, there's definitely less hacky ways to do this. But quick and dirty for now.
  validates :state, presence: true, us_state: true

  # assume that the UI only allowed the user to post a valid state, i.e,
  # one that we have an office for, so this hook _shouldn't_ fail on a normal case.
  before_validation -> { self.office = Office.find_by(state: state) }, on: :create
end
