class SearchController < ApplicationController

  def index
    location = params[:location]
    conn = Faraday.new(url: "https://developer.nrel.gov")
    response = conn.get("api/alt-fuel-stations/v1/nearest.json?limit=1&api_key=#{ENV['FUEL_API_KEY']}") do |c|
      c.params[:location] = location
    end 
    result = JSON.parse(response.body, symbolize_names: true)
    @station = Station.new(result)

    @station_address = "#{@station.street_address}, #{@station.city}, #{@station.state}, #{@station.zip}"

    conn2 = Faraday.new(url: "http://www.mapquestapi.com/directions/v2/route")
    response2 = conn2.get("?key=#{ENV['MAP_QUEST_KEY']}") do |c|
      c.params[:from] = location
      c.params[:to] = @station_address
    end 
    result2 = JSON.parse(response2.body, symbolize_names: true)
    @route = Route.new(result2)
    # binding.pry
  end
  


end 