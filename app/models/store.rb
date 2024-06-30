class Store < ApplicationRecord
  has_many :inventories
  has_many :shoes, through: :inventories
end
