Factory.define :user do |f|
  f.sequence(:email) { |n| "chuck#{n}@norris.com" }
  f.password "chuck123"
end
