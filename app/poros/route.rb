class Route
  attr_reader :distance, :time, :maneuvers, :directions, :steps

  def initialize(data)
    # binding.pry
    @distance = data[:route][:distance]
    @time = data[:route][:formattedTime]
    @maneuvers = data[:route][:legs][0][:maneuvers]
    @directions = directions
    @steps = []
  end 

  def directions
    @steps = []
    @maneuvers.each do |step|
      @steps << step[:narrative]
    end 
    @steps
  end
  

end 