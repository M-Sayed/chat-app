pass = 'password123'

1.upto(5).each do |i|
  User.create(
    email: "user-#{i}@mail.com",
    password: pass,
    password_confirmation: pass
  )
end
