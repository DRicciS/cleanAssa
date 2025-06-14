puts "Cleaning database..."
Comment.destroy_all
Post.destroy_all
User.destroy_all

puts "Creating users..."
admin_user = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :admin
)

regular_user = User.create!(
  name: 'Regular User',
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: :regular
)

puts "Users created!"

puts "Creating posts..."
Post.create!(title: "Admin's First Post", body: "This post was created by the admin user.", user: admin_user)
Post.create!(title: "User's First Post", body: "This post was created by the regular user.", user: regular_user)

puts "Finished seeding!"
