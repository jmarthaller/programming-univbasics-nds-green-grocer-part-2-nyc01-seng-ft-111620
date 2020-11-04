require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  if coupons.length == 0
    cart
  else
    result = []
    cart.each do |grocery_item|
      coupons.each do |coupon|
      
        if grocery_item[:item] == coupon[:item]
          coupon[:item] = coupon[:item] + " W/COUPON"
          
          if grocery_item[:clearance] == true
            coupon[:clearance] = true
          else 
            coupon[:clearance] = false
          end
          
          coupon[:price] = coupon[:cost] / coupon[:num]
          coupon[:count] = coupon[:num]
          coupon.delete(:cost); coupon.delete(:num)
          grocery_item[:count] = grocery_item[:count] - coupon[:count]
          result << coupon
        end
      end
      result << grocery_item
    end
    result
  end
end


# def apply_clearance(cart)
#   update_array = []
#   cart.each do |grocery_item|
#     if grocery_item[:clearance] == true
#       grocery_item[:price] = (grocery_item[:price] * 0.8).round(2)
#     end
#     update_array << grocery_item
#   end
#   update_array
# end


# def checkout(cart, coupons)
# consolidated = consolidate_cart(cart)
# post_coupon = apply_coupons(consolidated, coupons)
# post_clearance = apply_clearance(post_coupon)
# grand_total = 0
 
# post_clearance.each do |grocery_item|
#   grand_total += (grocery_item[:price] * grocery_item[:count])
# end
  
# if grand_total > 100
#   grand_total *= 0.90
# else 
#   grand_total
# end
# end





def apply_clearance(cart)
  cart.each do |entry|
    if entry[:clearance] == true
      entry[:price] = (entry[:price] * 0.80).round(2)
    end
  end
end




def checkout(cart, coupons)
  consolidated = consolidate_cart(cart)
  couponed = apply_coupons(consolidated, coupons)
  clearanced = apply_clearance(couponed)
  grand_total = 0
  clearanced.each do |entry|
    grand_total += entry[:price] * entry[:count]
  end
  if grand_total > 100 
    grand_total *= 0.90
  end
  grand_total
end
























