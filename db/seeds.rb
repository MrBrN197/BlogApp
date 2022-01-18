# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

michael = User.create!(name: 'Michael', photo: 'no-photo', bio: 'this is my bio', posts_counter: 0)
wendy = User.create!(name: 'Wendy', photo: 'no-photo', bio: 'this is my bio', posts_counter: 0)
john = User.create!(name: 'John', photo: 'no-photo', bio: 'this is my bio', posts_counter: 0)
chris = User.create!(name: 'Chris', photo: 'no-photo', bio: 'this is my bio', posts_counter: 0)

post = michael.posts.create!(title: 'Cats and Dogs', text: 'this is first post ever!', comments_counter: 0, likes_counter: 0)
michael.posts.create!(title: 'Never ending fun', text: 'this is second post', comments_counter: 0, likes_counter: 0)
michael.posts.create!(title: 'The last person on the train', text: 'this is my third post about ', comments_counter: 0, likes_counter: 0)
michael.posts.create!(title: 'My Last Post', text: 'this is my absolute final post ya hear!', comments_counter: 0, likes_counter: 0)

wendy.comments.create!(text: 'really nice post Michael', post: post)
john.comments.create!(text: 'Well Done 👏👏👏', post: post)
chris.comments.create!(text: 'This is a great Read', post: post)
john.comments.create!(text: 'Love it!!!', post: post)