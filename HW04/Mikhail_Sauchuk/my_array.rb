# Implement your own `Array#my_map`, `Array#my_select`, `Array#my_each`.
# Notes: implement these methods in your custom module
# and then include it in the `Array` class.
# Important: Do not use #each, #select, #map in your implementation.

class Array
  def my_each
    i = 0
    while i < size
      yield(self[i]) if block_given?
      i += 1
    end
    self
  end

  def my_map
    map_list = []
    i = 0
    while i < size
      map_list << yield(self[i]) if block_given?
      i += 1
    end
    map_list
  end

  def my_select
    return to_enum unless block_given?

    select_list = []
    i = 0
    while i < size
      select_list << self[i] if yield(self[i])
      i += 1
    end
    select_list
  end
end

# array = [1, 2, 3, 4, 5]
# array.my_each { |elem| puts elem }
# arr_mapped = array.my_map { |elem| elem * 2 }
# puts arr_mapped.to_s
# arr_filt = array.my_select { |elem| elem > 3 }
# puts arr_filt.to_s
