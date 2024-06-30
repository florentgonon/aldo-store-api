class Shoe < ApplicationRecord
  has_many :inventories
  has_many :shops, through: :inventories
end
