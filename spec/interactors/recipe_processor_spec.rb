require "rails_helper"

describe RecipeProcessor do

  describe "#call" do
    it "calls the contentful service" do
      contentful_service = ContentfulService.new
      allow(ContentfulService).to receive(:new).and_return(contentful_service)
      allow(contentful_service).to receive(:fetch_recipes).and_return(recipe_raw_data)
      processor = RecipeProcessor.new

      processor.call

      expect(contentful_service).to have_received(:fetch_recipes)
    end

    it "serializes the recipes" do
      stub_contentfull_service
      serializer = RecipesSerializer.new(recipes: recipe_raw_data)
      allow(RecipesSerializer).to receive(:new).and_return(serializer)
      allow(serializer).to receive(:each_serialized_recipe).and_call_original
      processor = RecipeProcessor.new

      processor.call

      expect(serializer).to have_received(:each_serialized_recipe)
    end

    it "saves the recipe" do
      stub_contentfull_service
      recipe = Recipe.new(description: "yummy", title: "Good food")
      allow(Recipe).to receive(:new).and_return(recipe)
      allow(recipe).to receive(:save)
      processor = RecipeProcessor.new(recipes: recipe_raw_data)

      processor.call

      expect(recipe).to receive(:save)
    end
  end

  def stub_contentfull_service
    contentful_service = ContentfulService.new
    allow(ContentfulService).to receive(:new).and_return(contentful_service)
    allow(contentful_service).to receive(:fetch_recipes).and_return(recipe_raw_data)
  end

end