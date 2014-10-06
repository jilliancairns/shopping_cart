class Item
  def self.get_costs
    {}
  end

  def self.compute_total(n)
    remaining = n
    total = 0

    prices = self.get_prices
    prices_descending = prices.keys.sort.reverse

    prices_descending.each do |num_to_purchase|
      price = prices[num_to_purchase]
      count_at_this_price = (remaining / num_to_purchase).floor
      total += price.* count_at_this_price
      remaining -= count_at_this_price.* num_to_purchase
    end

    total
  end
end
