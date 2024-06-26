class TeamService
  def teams
    get_url("/teams?league=39&season=2023")
  end

  def get_url(url)
    response = conn.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://v3.football.api-sports.io") do |faraday|
      faraday.headers["x-rapidapi-key"] = Rails.application.credentials.soccer[:key]
    end
  end
end