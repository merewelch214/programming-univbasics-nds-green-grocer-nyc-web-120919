def find_item_by_name_in_collection(name, collection)
  i = 0 
  while i < collection.length do 
    if collection[i][:item] == name 
      item = collection[i]
    end
    i += 1
  end  
  return item
end

def consolidate_cart(cart)
  cons_cart = []
  i = 0
  item_hash = {}
  while i < cart.length do
    if item_hash.value?(cart[i][:item])
      item_hash[:count] += 1
    elsif !item_hash.value?(cart[i][:item])
      item_hash = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
        }
      cons_cart << item_hash
    end
    i += 1
  end
 cons_cart
end

def apply_coupons(cart, coupons)
  # REMEMBER: This method **should** update cart
  i = 0
  j = 0
  while i < cart.length do
   
    while j < coupons.length do 
      
      if cart[i][:item] == coupons[j][:item] # check if item in cart has coupon, if it does proceed
        cost_per_item = coupons[j][:cost] / coupons[j][:num] # calc how much each item costs using a coupon
        if cart[i][:count] >= coupons[j][:num] # if there is a coupon, compare the count in cart with coupon num. 
          num_applications = cart[i][:count] / coupons[i][:num]
          round.num_applications
          if num_applications >= 1
            num_disc_items = num_applications * coupons[j][:num]
            count_after_coupons = cart[i][:count] - num_disc_items
            cart[i][:count] = count_after_coupons
            item_name = cart[i][:item]
            item_w_coupon = {
              :item => "#{item_name} W/COUPON", # create new item hash w coupon
              :price => cost_per_item,
              :clearance => cart[i][:clearance],
              :count => num_disc_items}
            cart.push(item_w_coupon) # put item into cart
          else 
            count_after_coupons = cart[i][:count] - (coupons[j][:num]) # get the new count for the existing item
            cart[i][:count] = count_after_coupons  #update existing item count
            item_name = cart[i][:item]
            item_w_coupon = {
              :item => "#{item_name} W/COUPON", # create new item hash w coupon
              :price => cost_per_item,
              :clearance => cart[i][:clearance],
              :count => coupons[j][:num]}
            cart.push(item_w_coupon) # put item into cart
          end
        end  
      end
      j += 1
    end
    i += 1
    cost_per_item = 0
    count_per_coupon = 0
  end
  return cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
