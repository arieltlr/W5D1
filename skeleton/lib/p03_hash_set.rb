class HashSet
  attr_accessor :count, :store
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
  end

  def include?(key)
    

  end

  def remove(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % num_buckets
    self.store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
