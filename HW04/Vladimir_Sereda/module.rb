# frozen_string_literal: true

module Modules
  def for_each
    counter = 0
    while counter < size
      yield(self[counter])
      counter += 1
    end
    self
  end
end

def for_map
  counter = 0
  new_arr = []
  while counter < size
    new_arr << yield(self[counter])
    counter += 1
  end
  new_arr
end

def for_select
  mutated_arr = []
  counter = 0
  while counter < length
    mutated_arr << (self[counter]) if yield(self[counter]) == true
    counter += 1
  end
  mutated_arr
end
