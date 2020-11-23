class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hashed = ""
    self.each_with_index do |ele, i|
      hashed += ele.hash.to_s[-5..-1]
    end
    hashed.to_i
  end
end

class String
  
  def hash
    alpha = ("a".."z").to_a
    hashed = ""
    self.each_char do |char|
      hashed += alpha.index(char).hash.to_s[-2..-1]
    end
    hashed.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
    hash_hash = ""

    array_hashes = []
    self.each do |k, v|
      array_hashes << [k, v]
    end

    array_hashes.each do |pair|
      pair.each do |val|
        if val.is_a?(Integer)
          hash_hash += val.hash.to_s
        else 
          hash_hash += val.to_s.hash.to_s
        end
      end
    end
    hash_hash.to_i
  end
end
