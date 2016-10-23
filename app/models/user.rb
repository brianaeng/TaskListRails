class User < ActiveRecord::Base
  has_many :tasks

  validates_presence_of :name, :email, :uid, :avatar
  validate :valid_email

  def self.build_from_github(auth_hash)
    user       = User.new
    user.uid   = auth_hash[:uid]
    user.provider = 'github'
    user.name  = auth_hash['info']['name']
    user.email = auth_hash['info']['email']
    user.avatar = auth_hash['extra']['raw_info']['avatar_url']
    user.authenticated = true

    return user
  end

  def valid_email
    if self.email != nil && !self.email.include?("@")
      errors.add(:users, "Invalid email")
    end
  end
end
