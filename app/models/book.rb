class Book < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :reviews
    has_one_attached :book_img
    has_many :orderables
    has_many :carts, through: :orderables
end
