require "rails_helper"

describe RecipeDataStore do

  describe "#write" do
    it "sets the data by calling the db set method" do
      db = recipe_test_db
      data = { id: "Ljbd78", description: "wonderful"} 
      allow(db).to receive(:set).and_call_original
      store = RecipeDataStore.new(db: db)

      store.write(data)

      expect(db).to have_received(:set).with("Ljbd78", data.to_json)
    end
  end

  describe "#read_all" do
    it "returns all the data saved" do
      db = build_redis_connection
      db.set("1L3k15", {id: "1L3k15", description: "test data"}.to_json)
      store = RecipeDataStore.new(db: db)

      result = store.read_all

      expect(result).to contain_exactly(
        {id: "1L3k15", description: "test data"}.to_json,
      )

      db.flushdb
    end
  end

  def build_redis_connection
    redis_connection = Redis.new
    Redis::Namespace.new(:marley_spoon_test, redis: redis_connection)
  end
end