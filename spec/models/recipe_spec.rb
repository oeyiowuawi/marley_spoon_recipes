require "rails_helper"

describe Recipe do


  describe "#save" do
    it "calls the datastore write method" do
      raw_recipe = { id: "B3stf00d",description: "Best food", title: "Jollof Rice",
                     chef_name: "Olalekan Eyiowuawi" }
      datastore = build_datastore
      allow(datastore).to receive(:write).and_call_original
      recipe = Recipe.new(raw_recipe.merge(datastore: datastore))

      recipe.save

      expect(datastore).to have_received(:write).with(recipe)
    end
  end

  describe ".all" do
    it "retrieves all the recipes that have been saved" do
      attributes = { id: "7S3n4", description: "Best food", title: "food",
                     chef_name: "Olalekan"}
      store = build_redis_connection
      datastore = RecipeDataStore.new(db: store)
      datastore.write(attributes)
      recipe = Recipe.new(attributes.merge(datastore: datastore))
      allow(RecipeDataStore).to receive(:new).and_return(datastore)

      recipes = Recipe.all

      expect(recipes).to contain_exactly(recipe)

      store.flushdb
    end
  end

  def build_datastore
    RecipeDataStore.new(db: recipe_test_db)
  end

  def build_redis_connection
    redis_connection = Redis.new
    Redis::Namespace.new(:marley_spoon_recipe_test, redis: redis_connection)
  end
end