class RecipeDataStore

  def initialize(db: nil)
    @db = db || build_redis_store
  end

  def write(recipe)
    
  end

  private

  def build_redis_store
    redis_connection = Redis.new
    Redis::Namespace.new(:marley_spoon, redis: redis_connection)
  end

end