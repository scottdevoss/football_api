class TeamFacade
  def initialize
    
  end

  def teams
    service = TeamService.new

    json = service.teams

    @teams = json[:response].map do |team|
      Team.new(team)
    end
  end
end