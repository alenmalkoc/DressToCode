class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid
  # attr_accessible :title, :body

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  unless user
    user = User.create(  provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
  end
  user
  end

  class << self
    def create_from_oauth(auth)
      user = User.find_by_email(auth.info.email)
      if user
        return {error: true, message: "User already Available"}
      else
        user = User.create(build_user_attributes(auth))
        if user && user.confirm!
          user.services.create(Service.build_attributes_from(auth))
          return user
        end
        return {error: true, message: user.errors.full_messages.join(", ")}
      end
    end

    def build_user_attributes(auth)
      {
        email: auth.info.email,
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        devise_user: false,
        password: "ewu_#{auth.provider}_password_#{Time.now.to_i}",
        gender: auth.extra.raw_info.gender,
      }
    end
  end

end
