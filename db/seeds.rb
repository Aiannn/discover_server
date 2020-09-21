# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all 
Like.destroy_all
Post.destroy_all

aian = User.create(username: 'Aian', password: 'Aian', name: 'Aian', date_of_birth: '12-12-1997', bio: 'Cool guy', email: 'soktoevayan@gmail.com')

aian.avatar.attach(
    io: File.open('./public/Spider-Man_FFH_Profile.jpg'),
    filename: 'Spider-Man_FFH_Profile.jpg',
    content_type: 'image/jpg'
)

bain = User.create(username: 'Bain', password: 'Bain', name: 'Bain', date_of_birth: '19-05-1999', bio: 'Cool guy', email: 'bain@gmail.com')

bain.avatar.attach(
    io: File.open('./public/download.jpeg'),
    filename: 'download.jpeg',
    content_type: 'image/jpeg'
)


post1 = Post.create(title: 'Captain', user_id: aian.id)

post1.image.attach(
    io: File.open('./public/download.jpeg'),
    filename: 'download.jpeg',
    content_type: 'image/jpeg'
)

post2 = Post.create(title: 'Angel', user_id: aian.id)

post2.image.attach(
    io: File.open('./public/download (1).jpeg'),
    filename: 'download (1).jpeg',
    content_type: 'image/jpeg'
)

post3 = Post.create(title: 'Marlboro', user_id: bain.id)

post3.image.attach(
    io: File.open('./public/download (2).jpeg'),
    filename: 'download (2).jpeg',
    content_type: 'image/jpeg'
)

post4 = Post.create(title: 'Babylon', user_id: bain.id)

post4.image.attach(
    io: File.open('./public/download (3).jpeg'),
    filename: 'download (3).jpeg',
    content_type: 'image/jpeg'
)

like1 = Like.create(post_id: post1.id,user_id: aian.id)
like2 = Like.create(post_id: post2.id,user_id: aian.id)
like3 = Like.create(post_id: post3.id,user_id: aian.id)
like4 = Like.create(post_id: post4.id,user_id: aian.id)

like5 = Like.create(post_id: post1.id, user_id: bain.id)
like6 = Like.create(post_id: post4.id, user_id: bain.id)