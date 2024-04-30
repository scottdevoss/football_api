require "rails_helper"

RSpec.describe "Logging In" do
  it "can log in a user with valid credentials" do
    user = User.create(name: "Abraham Lincoln", email: "honestabe@gmail.com", password: "honest", password_confirmation: "honest")
    
    visit "/"

    expect(page).to have_button "I already have an account"

    click_button "I already have an account"

    expect(current_path).to eq("/login")

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation

    click_button "Log In"

    expect(current_path).to eq("/user/#{user.id}")
    expect(page).to have_content("Welcome, #{user.name}!")
  end
end