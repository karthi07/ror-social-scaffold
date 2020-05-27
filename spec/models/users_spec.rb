require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:name).is_at_most(20) }
  end

  describe 'association' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:invitations) }
    it { should have_many(:inverse_invitations) }
    it { should have_many(:pending_invitations) }
    it { should have_many(:pending_friends) }
    it { should have_many(:inverse_pending_invitations) }
    it { should have_many(:inverse_pending_friends) }    
    it { should have_many(:accepted_invitations) }
    it { should have_many(:friends) }
  end
end
