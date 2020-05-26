require 'rails_helper'

RSpec.describe 'signup page', type: :feature do
  scenario 'signup with same conf password' do
    sign_up('user1', 'user1@test.com', 'password1', 'password1')
    expect(page).to have_content('Welcome! You have signed up successfully')
  end

  scenario 'signup page with worng' do
    sign_up('user1', 'user1@test.com', 'password1', 'password2')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
