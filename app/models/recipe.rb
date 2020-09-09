class Recipe
  attr_accessor :id, :description, :title, :photo_url, :chef_name, :tags

  def initialize(id:, description:, title:, photo_url: "", chef_name: "", tags: [], datastore: nil)
    @id = id
    @description = description
    @title = title
    @photo_url = photo_url
    @chef_name = chef_name
    @tags = tags
    @datastore = datastore || RecipeDataStore.new
  end

  def to_h(*args)
    {
      id: id, description: description, title: title, photo_url: photo_url,
      chef_name: chef_name, tags: tags
    }
  end

  alias :as_json :to_h

  def ==(other_recipe)
    id == other_recipe.id && description == other_recipe.description &&
    chef_name == other_recipe.chef_name && tags == other_recipe.tags &&
    title == other_recipe.title && photo_url == other_recipe.photo_url
  end

  def save
    datastore.write(self)
  end


  class << self
    def all
      store = RecipeDataStore.new
      store.read_all.map do |recipe|
        parsed_recipe = JSON.parse(recipe).symbolize_keys
        new(parsed_recipe)
      end
    end

    def find(id)
      store = RecipeDataStore.new
      raw_data = store.retrieve(id)
      if raw_data.present?
        parsed_recipe = JSON.parse(raw_data).symbolize_keys
        new(parsed_recipe)
      end
    end
  end


  private

  attr_reader :datastore

end