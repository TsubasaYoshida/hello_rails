class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable


  def self.find_for_google_oauth2(auth)
    user = User.where(email: auth.info.email).first

    unless user
      user = User.create(nickname: auth.info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         token: auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         confirmed_at: Time.zone.now
      )
    end
    user
  end

  def self.find_for_cognito(email)
    user = User.where(email: email).first

    unless user
      user = User.create(email: email,
                          password: Devise.friendly_token[0, 20],
                          confirmed_at: Time.zone.now
      )
    end
    user
  end

end