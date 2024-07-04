require "rails_helper"

RSpec.describe Inventory, type: :model do
  context "validations" do
    it "can't save with stock less than 0" do
      inventory = build(:inventory, stock: -1) 
      expect(inventory.save).not_to be_truthy
      expect(inventory.errors.messages).to eq({ stock: ["must be greater than or equal to 0"] })
    end
  end
end