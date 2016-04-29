include Warden::Test::Helpers
Warden.test_mode!

# Feature: User index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
feature 'User index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User listed on index page
  #   Given I am signed in
  #   When I visit the user index page
  #   If I am not the admin,
  #   I am redirected to the 'access denied' page
  scenario 'non-admin sees access-denied instead of user list' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content 'not authorized'
  end

  # Scenario: User listed on index page
  #   Given I am signed in
  #   When I visit the user index page
  #   If I am the admin,
  #   I see a list of registered users (names + emails)
  scenario 'admin sees list of users' do
    user = FactoryGirl.create(:admin)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content 'Registered Users'
  end

end
