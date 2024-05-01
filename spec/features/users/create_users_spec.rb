require 'rails_helper'

RSpec.describe "User registration form", :vcr do
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

  it "gives an error message if not all fields are filled", :vcr do
    visit "/"

    click_on "Register as a New User"

    expect(current_path).to eq("/users/new")

    fill_in :name, with: "Happy Gilmore"

    click_on "Create User"

    expect(current_path).to eq("/users/new")

    expect(page).to have_content("Please fill in all fields")
  end

  it "gives an error if passwords to not match", :vcr do
    visit "/"

    click_on "Register as a New User"

    expect(current_path).to eq("/users/new")

    fill_in :name, with: "Happy Gilmore"
    fill_in :email, with: "hockeyislife@gmail.com"
    fill_in :password, with: "hockey123"
    fill_in :password_confirmation, with: "wrongpassword"

    click_on "Create User"

    expect(current_path).to eq("/users/new")

    expect(page).to have_content("Passwords do not match")
  end
end