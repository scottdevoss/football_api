require "rails_helper"

RSpec.describe "Logging In" do
  it "can log in a user with valid credentials", :vcr do
    user = User.create(name: "Abraham Lincoln", email: "honestabe@gmail.com", password: "honest", password_confirmation: "honest")
    
    visit "/"

    expect(page).to have_button "I already have an account"

    click_button "I already have an account"

    expect(current_path).to eq("/login")

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation

    click_button "Log In"

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome, #{user.name}!")
  end

  it "cannot log in with bad credentials", :vcr do
    user = User.create(name: "Abraham Lincoln", email: "honestabe@gmail.com", password: "honest", password_confirmation: "honest")

    visit "/login"

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: "wrongpassword"

    click_on "Log In"

    expect(current_path).to eq("/login")

    expect(page).to have_content("Sorry, your credentials are bad.")
  end

  it "user can log out", :vcr do
    user = User.create(name: "Abraham Lincoln", email: "honestabe@gmail.com", password: "honest", password_confirmation: "honest")
    
    visit "/"

    expect(page).to have_button "I already have an account"

    click_button "I already have an account"

    expect(current_path).to eq("/login")

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation

    click_button "Log In"

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome, #{user.name}!")

    visit "/"

    expect(page).to have_button "Log Out"

    click_button "Log Out"

    expect(current_path).to eq("/")
    expect(page).to have_content("Successfully Logged Out")
    expect(page).to have_button("Register as a New User")
    expect(page).to have_button("I already have an account")
    expect(page).to_not have_button("Log Out")
  end
end