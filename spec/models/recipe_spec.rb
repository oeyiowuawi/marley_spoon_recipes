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

  def build_datastore
    db = OpenStruct.new do
      def set(_args)
      end
    end

    RecipeDataStore.new(db: db)
  end
end