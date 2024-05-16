require "rails_helper"

RSpec.describe "NFL Page" do
  it "has an NFL button on explore sports page", :vcr do
    user = User.create(name: "Abraham Lincoln", email: "honestabe@gmail.com", password: "honest", password_confirmation: "honest")
    
    visit "/"

    click_button "I already have an account"

    expect(current_path).to eq("/login")

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation

    click_button "Log In"

    expect(current_path).to eq("/users/#{user.id}")

    expect(page).to have_button("Explore Sports")

    click_button "Explore Sports"

    expect(current_path).to eq("/sports")

    click_button "NFL"

    expect(current_path).to eq("/NFL")
  end
end