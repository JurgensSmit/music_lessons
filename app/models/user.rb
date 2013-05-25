class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, 
                           :provider, :uid, :refresh_token, :access_token, :expires,
                           :about, :image_url, :gplus_url, :rate, :location, :user_type, :tag_list

  mount_uploader :image_url, AvatarUploader

  acts_as_taggable
  acts_as_taggable_on :tag_list

  has_many :messages
  
end
