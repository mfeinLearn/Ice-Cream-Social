# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # User
  malcome = User.create( username: 'Malcome Fein', password: 'password')

  # Brands
   edys_brand = Brand.create( name: "Edy's", in_grocery: false )
   ben_and_jerrys_brand = Brand.create( name: "Ben & Jerry's" , in_grocery: false)
   private_selection_brand = Brand.create( name: "Private Selection", in_grocery: false )

  # Ice Creams
  cappuccino_crush_ic = IceCream.create(flavor: 'Coffee',description: 'Coffee bean, Almonds, and water', brand_id: 1, user_id: 1)
  fresh_waffle_ic = IceCream.create(flavor: 'Strawberry',description: 'Strawberry, bread, and milk', brand_id: 1, user_id: 1)
  banana_split_ic = IceCream.create(flavor: 'Banana',description: 'Bananas with milk', brand_id: 2, user_id: 1)

  # Review
  fantastic_review = Review.create(stars: 4,title: 'Fantastic', content: 'This was the bomb. My toung is still salivating', user_id: 1, ice_cream_id: 1)
  fantastic_review = Review.create(stars: 2,title: 'ok', content: 'I have had better', user_id: 1, ice_cream_id: 2)
  fantastic_review = Review.create(stars: 3,title: 'good', content: 'Just enjoyable', user_id: 1, ice_cream_id: 3)
