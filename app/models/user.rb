class User < ActiveRecord::Base
    has_secure_password
    has_many :hikes 
    has_many :comments 
end