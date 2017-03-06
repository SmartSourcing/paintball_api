# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :player do

    firstname   { Faker::Name.first_name }
    lastname    { Faker::Name.last_name }
    nickname    { Faker::Lorem.word }
    number      { Faker::Number.number(3).to_s }
    age         { rand(0..101).to_s.rjust(3,'0') }
    dob         { (Faker::Time.between(DateTime.now - 40.years, DateTime.now - 20.years)).to_date }
    nationality { ['US','AR', 'UK', 'UR'].sample }
    position    { ["back", "snake", "center", "mid", "dorito"].sample }
    passport    { Faker::Number.number(10).to_s }
    captain     { [true,false].sample }
  end
end
