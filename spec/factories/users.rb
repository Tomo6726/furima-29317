FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"安倍"}
    last_name             {"仁"}
    first_name_kana       {"アベ"}
    last_name_kana        {"ジン"}
    birth_day             { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
