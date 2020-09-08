require "rails_helper"

describe RecipesSerializer do
  describe "#to_json" do
    it "returns an array of json object" do
      serializer = RecipesSerializer.new(recipes: recipe_raw_data)

      result = serializer.to_json

      expect(result).to be_kind_of(Array)
    end

    it "includes the recipe's description" do
      serializer = RecipesSerializer.new(recipes: recipe_raw_data)

      result = serializer.to_json
      recipe = result.first

      expect(recipe).to have_key(:description)
    end

    it "includes the recipe's title" do
      serializer = RecipesSerializer.new(recipes: recipe_raw_data)

      result = serializer.to_json
      recipe = result.first

      expect(recipe).to have_key(:title)
    end

    it "includes the recipe's photo url" do
      serializer = RecipesSerializer.new(recipes: recipe_raw_data)

      result = serializer.to_json
      recipe = result.first

      expect(recipe).to have_key(:photo_url)
    end

    it "includes the chef's name" do
      serializer = RecipesSerializer.new(recipes: recipe_raw_data)

      result = serializer.to_json
      recipe = result.first

      expect(recipe).to have_key(:chef_name)
    end

    it "includes a list of the tags available" do
      serializer = RecipesSerializer.new(recipes: recipe_raw_data)

      result = serializer.to_json
      recipe = result.first

      expect(recipe).to have_key(:tags)
    end
  end
end