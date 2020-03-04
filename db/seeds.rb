require 'faker'

puts 'seeding'

#clear db
ChallengeCategory.destroy_all
Category.destroy_all
Action.destroy_all
Challenge.destroy_all
User.destroy_all

# Categories
plastic = Category.create!(name: 'Plastic')
diet    = Category.create!(name: 'Diet')
travel  = Category.create!(name: 'Travel')
commute = Category.create!(name: 'Commute')
energy  = Category.create!(name: 'Energy')
waste   = Category.create!(name: 'Waste')

# Challenge to show in detail
nine_five = Challenge.create!(name: '9-fivers', num_days: 5, difficulty: 1)
Action.create!(title: "Morning Coffee! Swap out Cow milk for Non-dairy.",
              description: "That cup of coffee’s footprint just got reduces by ~50% CO2e! Try Oat milk! It's delicous!",
              impact: 30,
              challenge: nine_five)
Action.create!(title: "Commute via Bike or Public Transit or walk",
              description: "If your commute is 20-miles, the switch could lower your carbon footprint by 4,800 pounds annually",
              impact: 6000,
              challenge: nine_five)
Action.create!(title: "Prep flexitarian meal for lunches",
              description: 'Checkout this awesome app called "begun"!',
              impact: 1200,
              challenge: nine_five)
Action.create!(title: "Switch off your electronics when you leave the office",
              description: "A computer that is on for 8 hours a day emits 175 kg of CO2 per year.",
              impact: 450,
              challenge: nine_five)
Action.create!(title: "Choose a local beer at the 5a7, instead of an imported one",
              description: "300g CO2e: locally brewed cask ale at the pub vs. 500g CO2e: local bottled beer from a shop or foreign beer in a pub",
              impact: 200,
              challenge: nine_five)

ChallengeCategory.create!(challenge: nine_five, category: energy)
ChallengeCategory.create!(challenge: nine_five, category: commute)
ChallengeCategory.create!(challenge: nine_five, category: diet)

# 1st Challenge that you completed
starter = Challenge.create!(name: 'Starter Pack', num_days: 7, difficulty: 1)
Action.create!(title: "Use Reusable Water Bottle",
              description: "1 million bottles are bought every min, according to some studies.",
              impact: 83,
              challenge: starter)
Action.create!(title: "Use tupperware for leftovers / takeout",
              description: "2.2 billion take-out containers being used each year in EU alone.",
              impact: 150,
              challenge: starter)
Action.create!(title: 'Prep reusable bag',
              description: "An average plastic grocery bag weighs 5.5 grams therefore 1 kg of plastic contains approximately 180 bags",
              impact: 33,
              challenge: starter)
Action.create!(title: "Look up Local Farmer's Market / Bulk Store",
              description: "######",
              impact: 0,
              challenge: starter)
Action.create!(title: 'Grocery Shop: Replace 1 Meat with 1 plant-based protein',
              description: "######",
              impact: 1200,
              recurring: false,
              challenge: starter)
Action.create!(title: 'Repair Something Broken, instead of buying new',
              description: "Reach out to somebody in your community that can teach you it to fix it?",
              impact: 500,
              challenge: starter)
Action.create!(title: 'Repair Something Broken, instead of buying new',
              description: "Reach out to somebody in your community that can teach you it to fix it?",
              impact: 1000,
              recurring: false,
              challenge: starter)

ChallengeCategory.create!(challenge: starter, category: waste)
ChallengeCategory.create!(challenge: starter, category: plastic)
ChallengeCategory.create!(challenge: starter, category: diet)

# 2nd Challenge that you completed
activism = Challenge.create!(name: 'Enviro Activism 101', num_days: 5, difficulty: 2)
Action.create!(title: 'Watch a documentary. How about "Cowspiracy"?',
              description: "######",
              impact: 0,
              recurring: false,
              challenge: activism)
Action.create!(title: 'Have a conversation with your stranger about Sustainability',
              description: "######",
              impact: 0,
              recurring: false,
              challenge: activism)
Action.create!(title: 'Check out a local environmental group / organizing',
              description: "######",
              impact: 0,
              recurring: false,
              challenge: activism)
Action.create!(title: 'Be in solidarity with the Indigenous Community in your land',
              description: "######",
              impact: 0,
              recurring: false,
              challenge: activism)
Action.create!(title: 'Renew your commitment <3',
              description: "######",
              impact: 0,
              recurring: false,
              challenge: activism)

# Challenge to fill the page
single = Challenge.create!(name: 'Single Use Plastic, No More', num_days: 7, difficulty: 3)
ChallengeCategory.create!(challenge: single, category: plastic)

flexi   = Challenge.create!(name: 'Flexi 21 Dietary', num_days: 21, difficulty: 2)
ChallengeCategory.create!(challenge: flexi, category: diet)

grocery = Challenge.create!(name: 'Grocery List Re-Write', num_days: 7, difficulty: 1)
ChallengeCategory.create!(challenge: grocery, category: diet)

zero    = Challenge.create!(name: '30 Days Zero Waste', num_days: 30, difficulty: 3)
ChallengeCategory.create!(challenge: zero, category: waste)

student =Challenge.create!(name: 'Student Hack', num_days: 7, difficulty: 2)
ChallengeCategory.create!(challenge: student, category: diet)
ChallengeCategory.create!(challenge: student, category: commute)

parent  = Challenge.create!(name: 'Sustainability for Parents', num_days: 14, difficulty: 2)
ChallengeCategory.create!(challenge: parent, category: energy)
ChallengeCategory.create!(challenge: parent, category: diet)
ChallengeCategory.create!(challenge: parent, category: plastic)

biz     = Challenge.create!(name: 'Business Traveler Essentials', num_days: 2, difficulty: 1)
ChallengeCategory.create!(challenge: biz, category: travel)

mini    = Challenge.create!(name: 'Minimalism Living', num_days: 30, difficulty: 3)
ChallengeCategory.create!(challenge: mini, category: waste)

boot    = Challenge.create!(name: 'Enviromentalist Bootcamp', num_days: 45, difficulty: 3)
ChallengeCategory.create!(challenge: boot, category: plastic)
ChallengeCategory.create!(challenge: boot, category: waste)
ChallengeCategory.create!(challenge: boot, category: diet)

prod    = Challenge.create!(name: 'Natural Products 101', num_days: 7, difficulty: 3)
ChallengeCategory.create!(challenge: prod, category: plastic)

mason   = Challenge.create!(name: 'Mason Jar Challenge', num_days: 365, difficulty: 3)
ChallengeCategory.create!(challenge: mason, category: waste)

gt      = Challenge.create!(name: 'Grow a green thumb', num_days: 100, difficulty: 1)
ChallengeCategory.create!(challenge: mason, category: energy)

holiday = Challenge.create!(name: 'Holiday shopping hack', num_days: 3, difficulty: 1)
ChallengeCategory.create!(challenge: holiday, category: waste)


# user faker for now
User.create!(username: 'nour', email: 'nour@day-o.cc', password: '123456', location: 'Montreal, Canada')
User.create!(username: 'laurence', email: 'laurence@day-o.cc', password: '123456', location: 'Montreal, Canada')
User.create!(username: 'clem', email: 'clem@day-o.cc', password: '123456', location: 'Montreal, Canada')
User.create!(username: 'carms', email: 'carms@day-o.cc', password: '123456', location: 'Montreal, Canada')

20. times do
  User.create!(username: Faker::Name.unique.name,
              email: Faker::Internet.email,
              password: '123456',
              location: Faker::Address.country )
end

puts 'completed'
# Action.create!(title: "Replace 1 Meat with 1 plant-based protein",
#               description: 'Tempeh maybe?')
# Action.create!(title: "Choose Fruits & Veggie in Season",
#               description: '')
# 'Visit a Second Hand Store'
# 'Plastic Free Picnic'
# '15 mins beach clean'
# 'Go for a bike ride'
# 'Zero waste BBQ'
# 'Go star gazing'
# 'Make your own humus'
# 'Plant a tree seed'
# 'Donate 10 items that no longer serves you'
# 'Hug a tree'
# 'Walk today, instead of driving'
# 'Share a shower'
# 'Learn Furoshiki gift wrapping'
# 'Buy a local craft beer'
# 'Check out a community group'
# 'Set goals for the next 6 months'
