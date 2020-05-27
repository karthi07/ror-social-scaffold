require 'rails_helper'

RSpec.describe 'Friend Request', type: :feature do
  user1 = ['user1', 'user1@test.com', 'password1']
  user2 = ['user2', 'user2@test.com', 'password2']

  before(:all) do
    sign_up('user1', 'user1@test.com', 'password1', 'password1')
    click_on 'Sign out'
    sign_up('user2', 'user2@test.com', 'password2', 'password2')
    click_on 'Sign out'
  end

  scenario 'Add friend' do
    login(user2[1], user2[2])
    visit users_path
    click_link 'Invite to friendship'
    expect(page).to have_content('Request Pending')
  end

  scenario 'Accept friend Request' do
    login(user2[1], user2[2])
    visit users_path
    click_link 'Invite to friendship'
    click_on 'Sign out'
    login(user1[1], user1[2])
    visit users_path
    click_link 'Accept request'
    expect(page).to have_content('Friend request accepted')
    expect(page).to have_content('Unfriend')
  end

  scenario 'Reject friend Request' do
    login(user2[1], user2[2])
    visit users_path
    click_link 'Invite to friendship'
    click_on 'Sign out'
    login(user1[1], user1[2])
    visit users_path
    click_link 'Reject request'
    expect(page).to have_content('Invite to friendship')
  end

  scenario 'Unfriend' do
    login(user2[1], user2[2])
    visit users_path
    click_link 'Invite to friendship'
    click_on 'Sign out'
    login(user1[1], user1[2])
    visit users_path
    click_link 'Accept request'
    expect(page).to have_content('Friend request accepted')
    click_link 'Unfriend'
    expect(page).to have_content('Invite to friendship')
  end
end
