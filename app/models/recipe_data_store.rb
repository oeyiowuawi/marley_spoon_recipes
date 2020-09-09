class RecipeDataStore

  def initialize(db: nil)
    @db = db || build_redis_store
  end

  def write(data)
    data = data.to_h
    db.set(data[:id], data.to_json)
  end

  private

  attr_reader :db

  def build_redis_store
    redis_connection = Redis.new
    Redis::Namespace.new(:marley_spoon, redis: redis_connection)
  end

end