class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :invitations
  has_many :inverse_invitations, class_name: :Invitation, foreign_key: :friend_id


  has_many :pending_invitations, -> { where is_accepted: false }, class_name: "Invitation", foreign_key: "user_id"
  has_many :pending_friends, through: :pending_invitations, source: :friend
  has_many :inverse_pending_invitations, -> { where is_accepted: false }, class_name: "Invitation", foreign_key: "friend_id"
  has_many :inverse_pending_friends, through: :inverse_pending_invitations, source: :user

  
  def friends
    friends_array = invitations.map { |invite| invite.friend if invite.is_accepted == true }
    friends_array += inverse_invitations.map { |invite| invite.user if invite.is_accepted == true }
    friends_array.compact
  end

  def confirm_friend(user)
    
    confrimation = Invitation.find { |invite| invite.user == user }
    confrimation.is_accepted = true
    confrimation.save
    revese_confirmation = self.invitations.build(friend_id: user.id, is_accepted: true)
    revese_confirmation.save
  end

  def friend?(user)
    friends.include?(user)
  end
end
