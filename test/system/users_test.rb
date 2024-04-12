require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    click_link 'Users'
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    click_link 'Users'
    click_on "New user"

    fill_in "Name", with: @user.name
    fill_in "Password", with: "secret"
    fill_in "Confirm", with: "secret"
    click_on "Create User"

    assert_text "User dave was successfully created"
  end

  test "should update User" do
    click_link 'Users'
    click_on "Edit this user", match: :first

    fill_in "Name", with: @user.name
    fill_in "Current Password", with: "secret"
    fill_in "New Password", match: :first, with: "secret"
    fill_in "Confirm New Password", with: "secret"    
    click_on "Update User"

    assert_text "User dave was successfully updated"

  end

  test "should destroy User" do
    click_link 'Users'
    click_on "Show this user", match: :first
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end

  test "not login people can't access users" do 
    click_button 'Logout'
    assert_text "Home"
    assert_no_text "Orders"
    assert_no_text "Products"
    assert_no_text "Users"
    assert_no_text "Logout"
    visit users_url
    assert_no_selector "h1", text: "Users"
    assert_text "Please Log In"
  end
end
