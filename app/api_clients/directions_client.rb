require 'httparty'
require 'json'
require 'awesome_print'

class DirectionsClient
  include HTTParty
  base_uri 'https://maps.googleapis.com/maps/api/directions/json'

  def make_api_request(args={})
    origin = args.fetch(:origin)
    destination = args.fetch(:destination)
    mode = args.fetch(:mode)
    options = { key: ENV['GOOGLE_API_KEY'],
                      origin: origin,
                      destination: destination,
                      mode: mode }
    response = self.class.get('', query: options)

    if response.success?
      result = JSON.parse(response.body)
      distance = result["routes"][0]["legs"][0]["distance"]["text"]
      duration = result["routes"][0]["legs"][0]["duration"]["text"]
      return {distance: distance, duration: duration}
    else
      "Duration Request Failed"
    end
  end
end
