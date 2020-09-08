class RecipeProcessor
  attr_reader :recipe_count

  def initialize
    @contentful_service = ContentfulService.new
  end


  def call
    fetch_recipes
  end

  private

  attr_reader :contentful_service, :recipes

  def fetch_recipes
    @recipes = contentful_service.fetch_recipes
  end

end