class Recipe
  attr_accessor :description, :title, :photo_url, :chef_name, :tags

  def initialize(description:, title:, photo_url: "", chef_name: "", tags: [])
    @description = description
    @title = title
    @photo_url = photo_url
    @chef_name = chef_name
    @tags = tags
  end

  # def self.build(raw_recipes)
  #   recipes = []
  #   serializer = RecipesSerializer.new(recipes: raw_recipes)
  #   serializer.each_serialized_recipe do |serialized_recipe|
  #     recipes << new(serialized_recipe)
  #   end
  #   recipes
  # end
end