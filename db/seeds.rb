# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create admin user

ActiveRecord::Base.transaction do
  a = User.create!(email: 'admin@admin.com', password: 'Ilovebetahaus', first_name: 'P', last_name: 'ennis', role: 'admin')

  u = User.create!(email: 'yonah@betahaus.es', password: 'secret12321421', first_name: 'Yonah', last_name: 'Frost', role: 'member')

  article1 = a.articles.create!(title: 'Lorem ipsum Restaurant', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
  article2 = u.articles.create!(title: 'Sed ut Bar', content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?')
  article3 = u.articles.create!(title: 'Bar hopping in Gracia', content: 'Bar hopping in gracia.  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?')
  article1.mood_list.add(Article::MOODS.sample(rand(3..5)))
  article2.mood_list.add(Article::MOODS.sample(rand(3..5)))
  article3.mood_list.add(Article::MOODS.sample(rand(3..5)))
  article1.category_list.add(Article::CATEGORIES.sample)
  article2.category_list.add(Article::CATEGORIES.sample)
  article3.category_list.add(Article::CATEGORIES.sample)
  article1.save!
  article2.save!
  article3.save!
  
  article1.locations = [Location.create!(name: 'Betahaus', latitude: 41.4069647, longitude: 2.1568569)]
  article2.locations = [Location.create!(name: 'Can Tresó', latitude: 41.402982, longitude: 2.153739)]
  article3.locations  =[ Location.create!(name: 'Muntanya de Montjuïc', latitude: 41.3641667, longitude: 2.1580556),
                         Location.create!(name: 'Tibidabo', latitude: 41.4209857, longitude: 2.1187937)]

end