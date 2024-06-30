class Inventory < ApplicationRecord
  belongs_to :shop
  belongs_to :shoe

  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
