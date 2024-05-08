require "rails_helper"

describe TeamService do
  context "class methods", :vcr do
    context "#teams" do
      it "returns team data" do
        team = TeamService.new.teams

        expect(team).to be_a Hash
        expect(team[:response]).to be_a Array
        
        team_data = team[:response].first

        expect(team_data).to have_key :team
        expect(team_data[:team]).to have_key :id
        expect(team_data[:team]).to have_key :name
        expect(team_data[:team]).to have_key :logo
        expect(team_data[:team][:id]).to be_a Integer
        expect(team_data[:team][:name]).to be_a String
        expect(team_data[:team][:logo]).to be_a String
      end
    end
  end
end