class User < ApplicationRecord
  # Just doing the bare minimum for devise here for testing purposes.
  # Create a User in the rails console using the helper method below
  devise :database_authenticatable, :validatable, :timeoutable

  # Quick and dirty seed user creation. May replace with actual seed users in a
  # future iteration.
  def self.create_test_user!(params)
    return unless Rails.env.development? || Rails.env.test?

    # TODO: add roles, etc
    User.create!(
      email: params.fetch(:email).downcase,
      password: params.fetch(:password),
      password_confirmation: params.fetch(:password)
    )
  end
end
