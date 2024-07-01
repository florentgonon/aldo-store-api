class Inventory < ApplicationRecord
  belongs_to :store
  belongs_to :shoe

  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
