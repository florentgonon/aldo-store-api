FactoryBot.define do
  factory :inventory do
    store { build(:store) }
    shoe { build(:shoe) }
    stock { SecureRandom.random_number(100) }
  end
end
