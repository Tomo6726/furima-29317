FactoryBot.define do
  factory :item do
    
    name            {"お芋"}
    introduction    {"とても美味しい"}
    price           {300}
    category_id     {3}
    status_id       {3}
    shipping_fee_id {3}
    prefecture_id   {3}
    shipping_day_id   {3}
  end
end
