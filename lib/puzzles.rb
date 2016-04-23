require 'puzzles/version'

module Puzzles
  # Your code goes here...
  def self.random_infinite_list(iterator, k)
    result = []
    prng = Random.new
    iterator.each_with_index do |elem, idx|
      # Replace an element in the list
      (0..k - 1).each { |x| result[x] = elem if prng.rand < (1.0 / (idx + 1)) }
    end
    result
  end
end
