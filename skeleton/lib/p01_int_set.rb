class MaxIntSet
  #{ 0, 2, 3 }
  attr_accessor :store

  def initialize(max)
    @store = [false] * max
    @max = max
    (0..max).each do |i|
      @store[i] = true if self.include?(i)
    end
  end

  def insert(num)
    is_valid?(num)
    validate!(num)
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 0
  end

  def validate!(num)
    @store[num] = true
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].pop(num)

  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % @num_buckets
    @store[i]
  end


  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      self[num].push(num) 
      @count += 1
    end
    if @count > @num_buckets
      resize!
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].pop(num) 
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  # def count(num)
  #   overall_count = 0
  # end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % @num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_nums = @store.flatten
   initialize(num_buckets * 2)
   old_nums.each do |int|
      insert(int)
   end
  end
end
