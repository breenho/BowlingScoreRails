FactoryGirl.define do
  factory :try do
    try_1     { Faker::Try.try_1 }
    try_2     { Faker::Try.try_2 }
    frame_id  { Faker::Try.frame_id }
  end
end