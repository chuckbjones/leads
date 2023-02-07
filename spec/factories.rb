FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email(name: name) }
    phone { Faker::PhoneNumber.cell_phone }
    state { Faker::Address.state_abbr }
  end
end

FactoryBot.define do
  factory :office do
    name { Faker::Address.state }
    state { Faker::Address.state_abbr }
  end
end

FactoryBot.define do
  factory :role do
  end
end

FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end
