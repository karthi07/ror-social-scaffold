class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[ twitter ]

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :invitations
  has_many :inverse_invitations, class_name: :Invitation, foreign_key: :friend_id

  has_many :pending_invitations, -> { where is_accepted: false }, class_name: 'Invitation', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_invitations, source: :friend
  has_many :inverse_pending_invitations, -> { where is_accepted: false },
           class_name: 'Invitation', foreign_key: 'friend_id'
  has_many :inverse_pending_friends, through: :inverse_pending_invitations, source: :user
  has_many :accepted_invitations, -> { where is_accepted: true }, class_name: 'Invitation', foreign_key: 'user_id'
  has_many :friends, through: :accepted_invitations, source: :friend

  def confirm_friend(user)
    confrimation = Invitation.find { |invite| invite.user == user }
    confrimation.is_accepted = true
    confrimation.save
    revese_confirmation = invitations.build(friend_id: user.id, is_accepted: true)
    revese_confirmation.save
  end

  def friend?(user)
    friends.include?(user)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.name = auth.info.name # assuming the user model has a name
    #user.username = auth.info.nickname # assuming the user model has a username
    #user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    end
  end

  def email_required?
    false
  end
end
