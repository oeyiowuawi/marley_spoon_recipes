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
  end

end