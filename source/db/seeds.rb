10.times do
  User.create(username: Faker::Name.name, password:
    'boom')

  array = [1,2,3]
  array.sample
end
