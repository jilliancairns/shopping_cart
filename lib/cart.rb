require_relative 'item'
require_relative '../lib/items/apple'
require_relative '../lib/items/pear'
require_relative '../lib/items/orange'

class Cart
  attr_reader :total

  def initialize
    @merchandise = Hash.new(0)
    @prices = Hash.new(0)
    @total = 0
  end

  def add(item)
    validate_item(item)

    item_count = @merchandise[item] += 1

    @prices[item] = item.compute_total(item_count)

    @total = @prices.values.inject { |sum, x| sum + x }
  end

  private

  def validate_item(item)
    raise "Invalid item #{item.inspect}, expecting #{Item.inspect}" unless item.is_a? Class and item < Item
  end
end
