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

  attr_reader :contentful_service, :recipes, :raw_recipe

  def fetch_recipes
    @raw_recipe = contentful_service.fetch_recipes
  end

  def serialize_recipes
    @recipes = Recipe.build(@raw_recipe)
  end

end