class User < ActiveRecord::Base

    has_secure_password

    has_may :posts
    
end