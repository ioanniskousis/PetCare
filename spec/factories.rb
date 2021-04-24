FactoryBot.define do
  factory :user do
    email { 'test1@example.com' }
    password { 'f4k3p455w0rd' }
    firstname { 'John' }
    surname { 'Cousis' }
    # using dynamic attributes over static attributes in FactoryBot

    # if needed
    is_active true
  end
end
