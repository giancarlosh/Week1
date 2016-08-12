require 'pry'
class ShoppingCart
    attr_reader :prices
    def initialize prices
        @items={}
        @prices=prices
        @total=0
    end
    def add_item_to_cart item
        if @items[item]==nil
            @items[item]=1
            suma item
        else
            @items[item] +=1
            suma item
        end
    end
    def show
        @items.each do |key, value|
            print "#{value} : #{key} "  
            puts @prices[key]*value
        end

    end
    def suma item
        @total+=@prices[item]

    end
    def cost
        ShoppingPay.calculate_cost @total, @items, @prices
        # puts @total
    end
end

class ShoppingPay
    def self.calculate_cost total, items, prices
        
        if items[:apple]!=nil
            aux=items[:apple]/2
            total=total-(aux*prices[:apple])
        end
        if items[:oranges]!=nil
            aux=items[:oranges]/3
            total=total-((3-aux)*prices[:oranges])
        end
        if items[:grapes]!=nil
            aux=items[:grapes]/4
            if aux>0
                puts "por tu compra recibes #{aux} bananas"
            end
        end  
        puts total
    end

end

y_prices={
spring:{apple: 10, oranges: 5, grapes: 15, banana: 20, watermelon: 50},
summer:{apple: 10, oranges: 2, grapes: 15, banana: 20, watermelon: 50},
autumn:{apple: 15, oranges: 5, grapes: 15, banana: 20, watermelon: 50},
winter:{apple: 12, oranges: 5, grapes: 15, banana: 21, watermelon: 50}}

class Season
    def self.choose_prices y_prices
        season="spring".to_sym
        y_prices[season]
    end
end
prices =Season.choose_prices y_prices

cart = ShoppingCart.new prices

cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :oranges
cart.add_item_to_cart :oranges
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :grapes
cart.add_item_to_cart :oranges



cart.show
cart.cost
