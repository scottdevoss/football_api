require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit "/"

    click_on "Register as a New User"

    expect(current_path).to eq("/users/new")

    fill_in :name, with: "Happy Gilmore"
    fill_in :email, with: "hockeyislife@gmail.com"
    fill_in :password, with: "hockey123"
    fill_in :password_confirmation, with: "hockey123"

    click_on "Create User"

    expect(page).to have_content("Welcome, Happy Gilmore!")
  end
end