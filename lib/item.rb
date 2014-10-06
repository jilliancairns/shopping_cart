class Item
  def self.get_costs
    {}
  end

  def self.compute_total(n)
    remaining = n
    total = 0

    prices = self.get_prices
    prices_descending = prices.keys.sort.reverse

    # Go through each price tier from highest to lowest number of required items
    # Pick off as many of that tier as possible (e.g. 40 out of 49 items for a "10 for $1.00" tier)
    # Add to the total price, subtract from remaining items, then go on to the next tier
    # I feel like this could be cleaner
    prices_descending.each do |num_to_purchase|
      price = prices[num_to_purchase]
      count_at_this_price = (remaining / num_to_purchase).floor
      total += price.* count_at_this_price
      remaining -= count_at_this_price.* num_to_purchase
    end

    total
  end
end
