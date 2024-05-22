class FootballController < ApplicationController
  def index
    conn = Faraday.new(url: "https://v1.american-football.api-sports.io") do |faraday|
      faraday.headers["x-rapidapi-key"] = Rails.application.credentials.soccer[:key]
    end

    response = conn.get("/teams?league=1&season=2022")

    json = JSON.parse(response.body, symbolize_names: true)
    
    @teams = json[:response]
    # require 'pry'; binding.pry
  end
end