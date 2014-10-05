require_relative 'item'
require_relative '../lib/items/apple'
require_relative '../lib/items/pear'
require_relative '../lib/items/orange'

class Cart
  attr_reader :total

  def initialize
    @merchandise = {}
    @total = 0
  end

  def add(item)
    if @merchandise.has_key? item
      @merchandise[item] += 1
    else
      @merchandise[item] = 1
    end

    compute_total
  end

  def compute_total
    @total = 0

    @merchandise.each do |item, number|
      @total += item.compute_total(number)
    end
  end
end
