class User < ActiveRecord::Base

    has_secure_password

    has_many :posts

    validates :email, uniqueness: true

end