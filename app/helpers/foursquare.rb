module Foursquare
  extend self

  def client
    @client ||= Foursquare2::Client.new(
      client_id: ENV['foursquare_client_id'],
      client_secret: ENV['foursquare_client_secret'])
  end

  def fetch_venue id
    client.venue(id)
  end
end
