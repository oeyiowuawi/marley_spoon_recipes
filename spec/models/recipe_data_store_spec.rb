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
end