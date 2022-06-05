class Station
  attr_reader :name, :street_address, :city, :state, :zip, :fuel_type, :access_times, :longitude, :latitude

  def initialize(data)
    # binding.pry
    @name = data[:fuel_stations][0][:station_name]
    @street_address = data[:fuel_stations][0][:street_address]
    @city = data[:fuel_stations][0][:city]
    @state = data[:fuel_stations][0][:state]
    @zip = data[:fuel_stations][0][:zip]
    @fuel_type = data[:fuel_stations][0][:fuel_type_code]
    @access_times = data[:fuel_stations][0][:access_days_time]
    @longitude = data[:fuel_stations][0][:longitude]
    @latitude = data[:fuel_stations][0][:latitude]
  end 


end 