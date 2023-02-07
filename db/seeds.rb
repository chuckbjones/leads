# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Office.create!(state: "CA", name: "California")
Office.create!(state: "CO", name: "Colorado")
Office.create!(state: "GA", name: "Georgia")
Office.create!(state: "MA", name: "Massachusetts")
Office.create!(state: "TX", name: "Texas")

Office.all.each do |office|
  3.times do |i|
    name = Faker::Name.unique.name
    Customer.create!(
      name: name,
      state: office.state,
      email: Faker::Internet.safe_email(name: name),
      phone: Faker::PhoneNumber.cell_phone
    )
  end
end

if ENV["SEED_PASSWORD"].present? && (Rails.env.development? || Rails.env.test?)
  admin =
    User.create!(
      email: "superuser@example.com",
      password: ENV["SEED_PASSWORD"],
      password_confirmation: ENV["SEED_PASSWORD"]
    )

  admin.add_role(:admin)

  Office.all.each do |office|
    manager =
      User.create!(
        email: "#{office.state.downcase}_manager@example.com",
        password: ENV["SEED_PASSWORD"],
        password_confirmation: ENV["SEED_PASSWORD"]
      )

    manager.add_role(:manager, office)

    sales =
      User.create!(
        email: "#{office.state.downcase}_sales@example.com",
        password: ENV["SEED_PASSWORD"],
        password_confirmation: ENV["SEED_PASSWORD"]
      )

    sales.add_role(:sales, office)
  end
end
