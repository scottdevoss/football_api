class SoccerController < ApplicationController
  def index
    conn = Faraday.new(url: "https://v3.football.api-sports.io") do |faraday|
      faraday.headers["x-rapidapi-key"] = Rails.application.credentials.soccer[:key]
    end

    response = conn.get("/teams?league=39&season=2023")

    json = JSON.parse(response.body, symbolize_names: true)

    @teams = json[:response].map do |team|
      Team.new(team)
    end
    
  end

  def show
    conn = Faraday.new(url: "https://v3.football.api-sports.io") do |faraday|
      faraday.headers["x-rapidapi-key"] = Rails.application.credentials.soccer[:key]
    end

    response = conn.get("/teams?id=#{params[:id]}")

    json = JSON.parse(response.body, symbolize_names: true)

    @team = json[:response][0]

    response2 = conn.get("/players?team=#{params[:id]}&league=39&season=2023")

    json2 = JSON.parse(response2.body, symbolize_names: true)
   
    @players = json2[:response]
  end
end