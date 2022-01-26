# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


lorem40 = 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ipsam, labore nam? Perferendis hic, esse quia in corrupti doloremque laborum, omnis quae placeat facere aliquid amet excepturi. Tempore iure ab sapiente quidem earum expedita modi optio minima provident, ducimus, a pariatur.'
image1 = 'https://images.unsplash.com/photo-1552058544-f2b08422138a?w=300'
image2 = 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=300'
image3 = 'https://images.unsplash.com/photo-1546456073-92b9f0a8d413?w=300'
image4 = 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300'

wendy = User.new(name: 'Wendy', photo: image2 , bio: lorem40, posts_counter: 0, email: 'wendy@gmail.com', password: 'wendywendy')
wendy.skip_confirmation!
wendy.save!
john = User.create!(name: 'John', photo: image3, bio: lorem40, posts_counter: 0, email: 'john@gmail.com', password: 'johnjohn')
john.skip_confirmation!
john.save!
chris = User.create!(name: 'Chris', photo: image4 , bio: lorem40, posts_counter: 0, email: 'chris@gmail.com', password: 'chrischris')
chris.skip_confirmation!
chris.save!
michael = User.create!(name: 'Michael', photo: image1 , bio: lorem40, posts_counter: 0, email: 'michael@gmail.com', password: 'michaelmichael')
michael.skip_confirmation!
michael.save!

post1 = michael.posts.create!(title: 'Cats and Dogs', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)
michael.posts.create!(title: 'Never ending fun', text: 'this is second post but I don\'t think I should create another post again', comments_counter: 0, likes_counter: 0)
post3 = michael.posts.create!(title: 'The last person on the train', text: 'this is my third post about how I will never create another post in my life', comments_counter: 0, likes_counter: 0)
post4 = michael.posts.create!(title: 'My Last Post', text: 'this is my absolute final post ya hear!', comments_counter: 0, likes_counter: 0)

wendy.comments.create!(text: 'really nice post Michael', post: post1)
john.comments.create!(text: 'Well Done 👏👏👏', post: post1)
chris.comments.create!(text: 'This is a great Read', post: post1)
john.comments.create!(text: 'Love 💓 it!!!', post: post1)
john.comments.create!(text: 'Love 💕 it Aswell !!!', post: post4)
wendy.comments.create!(text: 'This is a terific post ', post: post4)

chris.comments.create!(text: 'We still need one more post😢', post: post3)

p5 = wendy.posts.create(title:'Sky is Blue', text: 'I saw a butterfly vanish into thin air like houdini' )
p6 = chris.posts.create(title:'Meaningless Life...', text: 'How many times have you seen them throw that same tantrum' )
p7 = john.posts.create(title:'I\'m sorry your majest', text: 'if you keep searching for for a new head you might lose your foot' )
p8 = wendy.posts.create(title:'Black & Teal', text: 'take two fans attach them together end to end stick a lolipop at the top; what do you get... two lolipops stuck end to end with a lolipop on top' )

michael.comments.create!(text: 'Nice stuff 💓', post: p6)
michael.comments.create!(text: 'Really great article!', post: p7)
michael.comments.create!(text: 'I still have some questions about this 🤔', post: p5)
john.comments.create!(text: 'I\'m not sure how to feel about this', post: p5)