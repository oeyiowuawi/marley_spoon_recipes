require "rails_helper"

describe RecipesSerializer do
  describe "#to_json" do
    it "returns an array of json object" do
      serializer = RecipesSerializer.new(recipes: recipe_raw_data)

      result = serializer.to_json

      expect(result).to be_kind_of(Array)
    end
  end
end