class HashSet
  attr_accessor :count, :store
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    
    num = key.hash
    
    
    if !self.include?(num)
      self[num].push(key) 
      self.count += 1
    end
    if self.count > @num_buckets
      resize!
    end
  end

  def include?(key)
    num = key.hash
    self[num].include?(key)

  end

  def remove(key)
    num = key.hash
    if self.include?(key)
      self[num].pop(key) 
      self.count -= 1
    end
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


# class ResizingIntSet
#   attr_accessor :count, :store

#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @num_buckets = num_buckets
#     @count = 0
#   end

#   def insert(num)
#     if !self.include?(num)
#       self[num].push(num) 
#       self.count += 1
#     end
#     if self.count > @num_buckets
#       resize!
#     end
#   end

#   def remove(num)
#     if self.include?(num)
#       self[num].pop(num) 
#       self.count -= 1
#     end
#   end

#   def include?(num)
#     self[num].include?(num)
#   end

#   private

#   # def count
#   #   overall_count = 0
#   # end

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#     i = num % @num_buckets
#     self.store[i]
#   end

#   def num_buckets
#     self.store.length
#   end

#   def resize!
#     old_nums = self.store.flatten
#    initialize(num_buckets * 2)
#    old_nums.each do |int|
#       insert(int)
#    end
