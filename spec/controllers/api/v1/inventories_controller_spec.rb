require "rails_helper"

RSpec.describe Api::V1::InventoriesController, type: :controller do
  before(:all) do
    @inventory = create(:inventory)
  end

  after(:all) do
    @inventory.destroy
  end
  describe "GET #index" do
    context "all is ok" do
      it "return a 200 with inventories" do
        get :index

        expect(response).to have_http_status(:ok)
        @inventory.destroy
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "return a 200 and updates the requested inventory" do
        put :update, params: { id: @inventory.id, inventory: { stock: 5 } }

        expect(response).to have_http_status(:ok)
        expect(@inventory.reload.stock).to eq(5)
      end
    end

    context "with invalid params" do
      context "inventory_id" do
        it "returns a 404 with 'Inventory not found' error" do
          put :update, params: { id: 10000000000, inventory: { stock: 5 } }
  
          expect(response).to have_http_status(:not_found)
          expect(JSON.parse(response.body)["errors"]).to eq(["Inventory not found"])
        end
      end

      context "stock less than 0" do
        it "returns a 400 with 'Unable to update inventory' error" do
          put :update, params: { id: @inventory.id, inventory: { stock: -1 } }
  
          expect(response).to have_http_status(:bad_request)
          expect(JSON.parse(response.body)["errors"]).to eq(["Unable to update inventory"])
        end
      end
    end
  end
end