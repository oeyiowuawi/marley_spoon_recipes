class RecipeDataStore

  def initialize(db: nil)
    @db = db || build_redis_store
  end

  def write(data)
    data = data.to_h
    db.set(data[:id], data.to_json)
  end

  def read_all
    key_store = []
    retrieve_all_keys(key_store)
    db.mget(key_store.flatten).compact
  end

  def retrieve(key)
    db.get(key)
  end

  private

  attr_reader :db

  def build_redis_store
    redis_connection = Redis.new
    Redis::Namespace.new(:marley_spoon, redis: redis_connection)
  end

  def retrieve_all_keys(key_store, cursor: 0)
    cursor, keys = db.scan(cursor, match: "*")
    if keys.empty?
      []
    else
      process_scan_result(key_store, keys, cursor)
        
    end
  end

  def process_scan_result(key_store, keys, cursor)
    key_store << keys
    if cursor.to_i.zero?
      key_store
    else
      retrieve_all_keys(key_store, cursor: cursor)
    end
  end

end