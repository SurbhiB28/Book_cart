class User < ApplicationRecord
    has_many :books

    has_secure_password


    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
    validates :password, presence: true
end
