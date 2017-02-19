FactoryGirl.define do
  factory :user do
    username "Pekka"
    password "Foobar1"
    password_confirmation "Foobar1"
  end

  factory :roastery do
    name "Coffee Garage"
    year 1980
  end

  factory :coffee do
    name "Kahvi"
    roastery
    style "Extra Dark"
  end

  factory :rating do
    score 10
  end

  factory :rating2, class: Rating do
    score 20
  end
end
