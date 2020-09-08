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

    it "serailizes the data so as to include the linked entries" do
      stub_contentfull_service
      recipe_serializer = RecipesSerializer.new(recipes: recipe_raw_data)
      allow(RecipesSerializer).to receive(:new).and_return(recipe_serializer)
      allow(recipe_serializer).to receive(:to_json).and_call_original
      processor = RecipeProcessor.new

      processor.call

      expect(recipe_serializer).to have_received(:to_json)
    end
  end

  def stub_contentfull_service
    contentful_service = ContentfulService.new
    allow(ContentfulService).to receive(:new).and_return(contentful_service)
    allow(contentful_service).to receive(:fetch_recipes).and_return(recipe_raw_data)
  end

end