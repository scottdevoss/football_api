class SoccerController < ApplicationController
  def index
    conn = Faraday.new(url: "https://v3.football.api-sports.io") do |faraday|
      faraday.headers["x-rapidapi-key"] = Rails.application.credentials.soccer[:key]
    end

    response = conn.get("/teams?league=39&season=2023")

    json = JSON.parse(response.body, symbolize_names: true)

    @teams = json[:response]
  end

  def show
    # require 'pry'; binding.pry
  end
end