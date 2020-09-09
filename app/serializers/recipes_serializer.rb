class RecipesSerializer
  def initialize(recipes: {})
    @raw_recipe_data = recipes["items"]
    @included_entry_data = recipes["includes"]["Entry"]
    @included_asset_data = recipes["includes"]["Asset"]
  end

  def to_json
    raw_recipe_data.map do |recipe|
      process recipe 
    end
  end

  def each_serialized_recipe(&block)
    raw_recipe_data.each do |raw_recipe|
      recipe = process(raw_recipe)
      block.call(recipe)
    end
  end

  private

  attr_reader :raw_recipe_data, :included_entry_data, :included_asset_data

  def process(recipe)
    { 
      id: recipe["sys"]["id"],
      description: recipe["fields"]["description"],
      title: recipe["fields"]["title"],
      photo_url: extract_photo_url(recipe["fields"]["photo"]["sys"]["id"]),
      chef_name: extract_chef_name(recipe),
      tags: extract_tags(recipe)
      }
  end

  def find_included_asset(asset_id)
    included_asset_data.find do |asset| 
      asset["sys"]["id"] == asset_id
    end
  end

  def extract_photo_url(asset_id)
    asset = find_included_asset(asset_id)
    asset["fields"]["file"]["url"]
  end

  def find_included_entry(id)
    included_entry_data.find do |asset| 
      asset["sys"]["id"] == id
    end
  end

  def extract_chef_name(recipe)
    return "" unless recipe["fields"]["chef"].present?
    id = recipe["fields"]["chef"]["sys"]["id"]
    chef = find_included_entry(id)
    chef["fields"]["name"]
  end

  def extract_tags(recipe)
    return [] unless recipe["fields"]["tags"].present?
    recipe["fields"]["tags"].map do |raw_tag|
      id = raw_tag["sys"]["id"]
      tag = find_included_entry(id)
      tag["fields"]["name"]
    end
  end
end