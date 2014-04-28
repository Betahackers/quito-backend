module Foursquare
  extend self

  def client(options={})
    @client ||= Foursquare2::Client.new(
      client_id: ENV['FOURSQUARE_CLIENT_ID'],
      client_secret: ENV['FOURSQUARE_CLIENT_SECRET'],
      api_version: '20140412',
      connection_middleware: ([[FaradayMiddleware::Caching, Rails.cache]] unless options[:no_cache])
    )
  end

  def fetch_venue id
    client.venue(id)
  end

  def search_venues input
    client(no_cache: true).search_venues({
      ll: barcelona,
      query: input,
    })['venues']
  end

  private
  def barcelona
    @barcelona ||= Geocoder.coordinates('Barcelona').join(',')
  end
end
