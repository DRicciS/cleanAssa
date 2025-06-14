# db/seeds.rb

puts "Cleaning database..."
Comment.destroy_all
Post.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create!(name: "Alice", email: "alice@example.com")
user2 = User.create!(name: "Bob", email: "bob@example.com")
user3 = User.create!(name: "Charlie", email: "charlie@example.com")

puts "Creating posts..."
post1 = user1.posts.create!(
  title: "Getting Started with Rails",
  body: "Ruby on Rails is a powerful framework for building web applications. This post will guide you through the initial setup and basic concepts to get you up and running."
)

post2 = user2.posts.create!(
  title: "Understanding MVC in Rails",
  body: "The Model-View-Controller (MVC) architecture is core to Rails. It separates the application logic, data, and presentation, leading to cleaner and more maintainable code."
)

post3 = user1.posts.create!(
  title: "A Deep Dive into ActiveRecord",
  body: "ActiveRecord is the M in MVC for Rails. It's an ORM (Object-Relational Mapping) library that connects your Ruby classes to database tables. This article explores its powerful querying and association features."
)

puts "Creating comments..."
Comment.create!(post: post1, user: user2, content: "Great introduction, very helpful!")
Comment.create!(post: post1, user: user3, content: "Looking forward to more content like this.")
Comment.create!(post: post2, user: user1, content: "This really cleared up how controllers and models interact.")
Comment.create!(post: post3, user: user2, content: "The associations part is exactly what I was looking for.")

puts "Finished seeding!"
