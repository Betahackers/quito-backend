module Foursquare
  extend self

  def client
    @client ||= Foursquare2::Client.new(
      client_id: ENV['foursquare_client_id'],
      client_secret: ENV['foursquare_client_secret'],
      api_version: '20140412'
    )
  end

  def fetch_venue id
    client.venue(id)
  end

  def search_venues input
    client.search_venues({
      ll: barcelona,
      query: input,
    })['venues']
  end

  private
  def barcelona
    @barcelona ||= Geocoder.coordinates('Barcelona').join(',')
  end
end
