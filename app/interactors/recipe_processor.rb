class RecipeProcessor
  attr_reader :recipe_count

  def initialize
    @contentful_service = ContentfulService.new
    @recipes = []
  end


  def call
    fetch_recipes
    serialize_recipes
  end

  private

  attr_reader :contentful_service, :recipes, :raw_recipes

  def fetch_recipes
    @raw_recipes = contentful_service.fetch_recipes
  end

  def serialize_recipes
    serializer = RecipesSerializer.new(recipes: @raw_recipes)
    serializer.each_serialized_recipe do |serialized_recipe|
      @recipes << Recipe.new(serialized_recipe)
    end
  end

end