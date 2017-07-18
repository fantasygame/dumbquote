User.create(
  role: "admin",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
)

user =
  User.create(
    role: "user",
    email: FFaker::Internet.email,
    password: "password",
    password_confirmation: "password",
  )

Quote.create!(
  user: user,
  content: FFaker::Lorem.paragraph,
)
