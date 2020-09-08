class RecipeProcessor
  attr_reader :recipe_count

  def initialize
    @contentful_service = ContentfulService.new
  end


  def call
    fetch_recipes
    serialize_recipes
  end

  private

  attr_reader :contentful_service, :recipes, :recipe_json

  def fetch_recipes
    @recipes = contentful_service.fetch_recipes
  end

  def serialize_recipes
    @recipe_json = RecipesSerializer.new(recipes: @recipes).to_json
  end

end