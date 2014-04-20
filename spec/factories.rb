FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :isAdmin do
      admin true
    end
  end

  factory :store do
    sequence(:name)  { |n| "Store #{n}" }
    sequence(:address)  { |n| "Address #{n}" }
     
  end
  
  factory :product do
    sequence(:name)  { |n| "ProductName #{n}" }
    sequence(:category)  { |n| "CategoryName #{n}" }
    sequence(:color)  { |n| "Color #{n}" }
    storage "8 GB"
    price 1200
    size "5 inch"
    
  end

  factory :product_stores, :parent => :store do
    products {[FactoryGirl.create(:product)]}
end


end