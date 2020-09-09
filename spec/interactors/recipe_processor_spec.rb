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

    it "builds the recipe objects" do
      stub_contentfull_service
      allow(Recipe).to receive(:build).and_call_original
      processor = RecipeProcessor.new

      processor.call

      expect(Recipe).to have_received(:build)
    end

    it "saves the recipe" do
      stub_contentfull_service
      recipe = Recipe.new
      allow(Recipe).to receive(:build).and_return([recipe])
      allow(recipe).to receive(:save)
      processor = RecipeProcessor.new

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