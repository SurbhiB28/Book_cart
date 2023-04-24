class Orderable < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  def total
    book.price * quantity
  end
end
