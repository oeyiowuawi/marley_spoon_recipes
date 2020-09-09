class RecipeProcessor
  attr_reader :recipe_count

  def initialize
    @contentful_service = ContentfulService.new
    @recipe_count = 0 
  end


  def call
    fetch_recipes
    process_recipes
  end

  private

  attr_reader :contentful_service, :recipes, :raw_recipes

  def fetch_recipes
    @raw_recipes = contentful_service.fetch_recipes
  end

  def process_recipes
    serializer = RecipesSerializer.new(recipes: @raw_recipes)
    serializer.each_serialized_recipe do |serialized_recipe|
      Recipe.new(serialized_recipe).save
      @recipe_count += 1
      puts "."
    end
  end

end