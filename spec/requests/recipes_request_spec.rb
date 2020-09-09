require 'rails_helper'
describe "RecipesController", type: :request do

  describe "GET #index" do

    it "returns a status code of 200" do
      get "/recipes"

      expect(response).to have_http_status(:success)
    end

    context "when recipes have been synced" do
      it "returns all the synced recipes" do
        store = stub_recipe_data_store
        attributes = { id: "s0m3b0d4", description: "Best food", title: "food",
                        chef_name: "Eyiowuawi"}
        store.write(attributes)

        get "/recipes"

        expect(response_body.first["id"]).to eq("s0m3b0d4")

        redis_con.flushdb
      end
    end

    context "when recipes haven't been synced" do
      it "returns an empty array" do
        get "/recipes"

       expect(response_body).to eq([])
      end
    end
  end

  describe "GET #show" do
    it "returns the recipe" do
      store = stub_recipe_data_store
      attributes = { id: "s0m3b0d4", description: "Best food", title: "food",
                      chef_name: "Eyiowuawi"}
      store.write(attributes)

      get "/recipes/s0m3b0d4"

      expect(response_body["description"]).to eq("Best food")

      redis_con.flushdb
    end

    context "when there is no recipe" do
      it "returns a 404 status error" do
        get "/recipes/s0m3b0d409"

        expect(response).to have_http_status(404)
      end
    end
  end

  def stub_recipe_data_store
    db = redis_con
    store = RecipeDataStore.new(db: db)
    allow(RecipeDataStore).to receive(:new).and_return(store)
    store
  end

  def response_body
    JSON.parse(response.body)
  end

  def redis_con
    con = Redis.new
    Redis::Namespace.new(:marley_spoon_recipe_test, redis: con)
  end
end