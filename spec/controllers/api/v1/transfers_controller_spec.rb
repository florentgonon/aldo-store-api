require "rails_helper"

RSpec.describe Api::V1::TransfersController, type: :controller do
  before(:all) do
    shoe = create(:shoe, name: "GRELIDIEN")
    @inventory1 = create(:inventory, shoe: shoe, store: create(:store), stock: 10)
    @inventory2 = create(:inventory, shoe: shoe, store: create(:store), stock: 10)
    @source_store = @inventory1.store
    @destination_store = @inventory2.store
  end

  after(:all) do
    @inventory1.destroy
    @inventory2.destroy
  end
  describe "POST #create" do
    context "with valid params" do
      it "return a 200" do
        post :create, params: { source_store_id: @source_store.id, destination_store_id: @destination_store.id, shoe_model_id: @inventory1.shoe.id, quantity: 5 }

        expect(response).to have_http_status(:ok)
        expect(@source_store.reload.inventories.first.stock).to eq(5)
        expect(@destination_store.reload.inventories.first.stock).to eq(15)
      end
    end

    context "with invalid params" do
      context "given quantity not available from source store" do
        it "returns a 302 with 'Not enough stock to transfer' error" do
          post :create, params: { source_store_id: @source_store.id, destination_store_id: @destination_store.id, shoe_model_id: @inventory1.shoe.id, quantity: 20 }
  
          expect(response).to have_http_status(:unprocessable_entity)
          expect(JSON.parse(response.body)["errors"]["base"]).to eq(["Not enough stock to transfer"])
        end
      end
    end
  end
end