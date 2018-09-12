require 'httparty'

class Wunderground
  include HTTParty
  format :json

  base_uri 'api.openweathermap.org/data/2.5'

  attr_accessor :coord, :weather

  def initialize(response)
    @coord = respose['coord']
    @weather = responde['weather']
  end

  def self.get_weather(city)
    response = get("/weather?q={city}")
    if response.success?
      new(response)
    else
      raise response.response
    end
  end

end
