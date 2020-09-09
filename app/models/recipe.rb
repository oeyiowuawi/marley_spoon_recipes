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

  def to_h
    {
      id: id, description: description, title: title, photo_url: photo_url,
      chef_name: chef_name, tags: tags
    }
  end

  def save
    datastore.write(self)
  end

  private

  attr_reader :datastore

end