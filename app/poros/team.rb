class Team
  attr_reader :name, :id, :logo
  def initialize(attributes)
    @name = attributes[:team][:name]
    @id = attributes[:team][:id]
    @logo = attributes[:team][:logo]
  end
end