class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts
  has_many :comments
  def self.from_omniauth(auth)
	user = User.where(email: auth.info.email).first

	    # Uncomment the section below if you want users to be created if they don't exist
	    unless user
	        user = User.create(name: auth['name'],
	           email: auth.info.email,
	           password: Devise.friendly_token[0,20],
		name: auth.info.name,   # assuming the user model has a name
		    provider: auth.provider,
		      uid: auth.id # assuming the user mode
	         )
	     end
	    user
  end
end
