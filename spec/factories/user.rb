FactoryBot.define do
    factory :user do
      id { @id }
      first_name { @first_name }
      last_name { @last_name }
      is_admin { @is_admin }
    end
  end