FactoryBot.define do
  
  factory :order_delivery do
    token       {'testtoken'}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '赤平市' }
    block_number { '1-1-1' }
    building_name { '' }
    phone_number { '09012345678' }
    association :user
    association :item
    # after(:build) do |sample|
    #   sample.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png')
    # end

  end
end