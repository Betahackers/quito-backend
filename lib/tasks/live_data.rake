# id: integer
# name: string
# foursquare_id: string
# latitude: float
# longitude: float

# id: integer
# title: string
# content: text
# created_at: datetime
# updated_at: datetime
# user_id: integer
# deleted_at: datetime)

namespace :data do
  require 'csv'

  def extract row, list
    row.to_h.slice(*list).select{|k,v| v}.map{|a| a[0].downcase}
  end

  def extract_categories row
    extract(row, [
      'Eat',
      'Drink',
      'Healthy Life',
      'Culture',
      'Shopping',
      'Dancing',
      'Live Music',
      'Walks',
    ])
  end

  def extract_moods row
    extract(row, [
      'Illegal',
      'Sociable',
      'Adventure',
      'Active',
      'Cultural',
      'Romantic',
      'Relaxed',
      'Solitary',
    ])
  end

  desc 'import the member data from the german XML export'
   task seed: :environment do
    Location.by_foursquare_id('4fab92ade4b066f573d4bf89')
    path = '/u/6253/quito.csv'

    conn = Faraday.new(:url => 'https://dl.dropboxusercontent.com')
    response = conn.get path
    CSV.parse(response.body, headers: :first_row) do |row|
      user = User.find_or_create_by!(email: row['email'].strip) do |u|
        first_name, last_name = row['name'].split(' ')
        u.first_name= first_name
        u.last_name= last_name
        u.nationality= row['nationality']
        u.about= row['description']
        u.expert_in= row['expert_in']
        u.twitter_handle= row['twitter'] && row['twitter'].remove(/@/).remove(/https?:\/\/twitter\.com\/?/).remove(/-/)
        u.website_url= row['website']
        u.role = 'member'
        u.password= SecureRandom.hex
      end
      fsq_id = row['foursquare'].split('/').last
      l = Location.by_foursquare_id(fsq_id)
      article_params = {
        title: row['title'],
        content: row['place_description'],
        user: user,
        mood_list: extract_moods(row),
        category_list: extract_categories(row),
      }
      article_params.merge!(locations: [l]) if l
      Article.create!(article_params)
    end
  end
end
