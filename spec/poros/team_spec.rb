require "rails_helper"

RSpec.describe Team do 
  it "exists" do
    attrs = {:team=>{:id=>33, :name=>"Manchester United", :code=>"MUN", :country=>"England", :founded=>1878, :national=>false, :logo=>"https://media.api-sports.io/football/teams/33.png"},
    :venue=>
     {:id=>556,
      :name=>"Old Trafford",
      :address=>"Sir Matt Busby Way",
      :city=>"Manchester",
      :capacity=>76212,
      :surface=>"grass",
      :image=>"https://media.api-sports.io/football/venues/556.png"}}

    team = Team.new(attrs)
  
    expect(team).to be_a Team
    expect(team.name).to eq("Manchester United")
    expect(team.id).to eq(33)
    expect(team.logo).to eq("https://media.api-sports.io/football/teams/33.png")
  end
end