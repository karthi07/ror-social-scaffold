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
  has_many :inverse_invitations, class_name: :Invitation , foreign_key: :friend_id

  def friends
    #friends_array = invitations.select {|invite|  invite.is_accepted == true}
    #friends_array + inverse_invitations.select {|invite|  invite.is_accepted == true}
    #friends_array.map { |user| user.friend_id}
    friends_array = invitations.map{|invite| invite.friend_id if invite.is_accepted == true}
    friends_array + inverse_invitations.map{|invite| invite.user_id if invite.is_accepted == true}
    friends_array.compact
  end

  # Users who have yet to confirme friend requests
  def pending_requests
    invitations.map{|invite| invite.friend if !invite.is_accepted}.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_invitations.map{|invite| invite.user if !invite.is_accepted}.compact
  end

  def confirm_friend(user)
    confrimation = inverse_invitations.find{|invite| invite.user == user}
    confrimation.is_accepted = true
    confrimation.save
  end

  def friend?(user)
    friends.include?(user.id)
  end
end
