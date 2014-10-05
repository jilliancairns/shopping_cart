require_relative 'item'
require_relative '../lib/items/apple'
require_relative '../lib/items/pear'
require_relative '../lib/items/orange'

class Cart
  attr_reader :total

  def initialize
    @merchandise = Hash.new(0)
    @total = 0
  end

  def add(item)
    @merchandise[item] += 1

    compute_total
  end

  def compute_total
    @total = 0

    @merchandise.each do |item, number|
      @total += item.compute_total(number)
    end
  end
end
