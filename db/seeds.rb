# Создание пользователей
users = []
10.times do
  users << User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

# Создание категорий
categories = []
5.times do
  categories << Category.create!(name: Faker::Lorem.word)
end

# Создание тегов
tags = []
10.times do
  tags << Tag.create!(name: Faker::Lorem.word)
end

# Создание постов
users.each do |user|
  rand(1..5).times do
    post = user.posts.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph
    )

    # Добавление категорий к посту
    post_categories = categories.sample(rand(1..3))
    post_categories.each do |category|
      post.categories << category
    end

    # Добавление тегов к посту
    post_tags = tags.sample(rand(1..5))
    post_tags.each do |tag|
      post.tags << tag
    end

    # Создание комментариев к посту
    rand(0..3).times do
      post.comments.create!(
        body: Faker::Lorem.paragraph,
        user: users.sample
      )
    end
  end
end