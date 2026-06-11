def stock_picker(prices)
  return nil if prices.nil? || prices.length < 2

  min_buy_day = 0
  max_profit = 0
  best_sell_day = nil
  best_buy_day = nil

  prices.each_with_index do |price, day|
    if price < prices[min_buy_day]
      min_buy_day = day
    end

    current_profit = price - prices[min_buy_day]
    if current_profit > max_profit
      max_profit = current_profit
      best_sell_day = day
      best_buy_day = min_buy_day
    end
  end

  return nil if max_profit <= 0

  [best_buy_day, best_sell_day]
end


# 1. Mảng rỗng (Empty array)
p stock_picker([]) 
# => nil (không có ngày nào để mua bán)
 
# 2. Mảng chỉ có 1 ngày (Single day)
p stock_picker([10]) 
# => nil (không thể mua và bán trong cùng 1 ngày)

# 3. Giá giảm liên tục (Strictly decreasing - Không thể sinh lời)
p stock_picker([10, 8, 5, 3, 1]) 
# => nil (nếu bạn quy ước không có lãi thì không mua bán, hoặc trả về nil)

# 4. Giá thấp nhất nằm ở ngày cuối cùng (Lowest price at the end)
p stock_picker([10, 2, 8, 15, 1]) 
# => [1, 3] (Mua ngày 1 giá 2, bán ngày 3 giá 15. Lãi $13. Không thể mua ở ngày cuối giá 1 vì không còn ngày nào sau đó để bán)

# 5. Giá cao nhất nằm ở ngày đầu tiên (Highest price at the beginning)
p stock_picker([20, 2, 5, 8, 3]) 
# => [1, 3] (Mua ngày 1 giá 2, bán ngày 3 giá 8. Lãi $6. Không thể bán ở ngày đầu giá 20 vì chưa mua)

# 6. Có nhiều cặp ngày cho cùng mức lãi cao nhất (Tie-breakers)
p stock_picker([2, 5, 1, 4]) 
# => [0, 1] hoặc [2, 3] (Cả hai cặp đều cho mức lãi là $3. Trả về cặp nào cũng đúng)

# 7. Giá đi ngang rồi mới tăng
p stock_picker([5, 5, 5, 10]) 
# => [0, 3] (Mua ngày 0 giá 5, bán ngày 3 giá 10. Lãi $5)