class Store < ApplicationRecord
  has_many :inventories
  has_many :shoes, through: :inventories

  def transfer_stock_to(destination_store, shoe, quantity)
    source_inventory = inventories.find_by(shoe: shoe)
    destination_inventory = destination_store.inventories.find_by(shoe: shoe)

    if source_inventory && source_inventory.stock >= quantity
      ActiveRecord::Base.transaction do
        source_inventory.update!(stock: source_inventory.stock - quantity)
        destination_inventory.update!(stock: destination_inventory.stock + quantity)
      end
      true
    else
      errors.add(:base, "Not enough stock to transfer")
      false
    end
  end
end
