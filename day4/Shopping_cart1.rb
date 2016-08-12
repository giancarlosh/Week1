require 'date'
class ShoppingCart
    def initialize
        @items = []
    end
    
    def add_item(item)
        @items.push(item)
    end
    
    def checkout
        total=0
        @items.each do |item|
           if @items.length<=5
               total+=item.price
           else
               total+=item.price*0.9
               
           end
        end
        puts "Your total today is $#{total}. Have a nice day!"
    end
end

class Item
    attr_reader :name, :price
    def initialize(name,price)
        @name=name
        @price=price
    end
    
    def price
        price=@price
    end
end

class Houseware < Item
    attr_reader :price 
    def price
        if @price>100
            @price=@price*0.90
        else
            @price
        end
    end
end

class Fruits < Item
    attr_reader :price
    def price
        date=Date.today
        if date.saturday? || date.sunday?
            @price=@price.*0.90
        else
            @price
        end
    end
end

joshs_cart = ShoppingCart.new
banana = Fruits.new("Banana", 10)
vaccuum = Houseware.new("Vaccuum", 150)
oj = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
anchovies = Item.new("Anchovies", 2)

joshs_cart.add_item(oj)
joshs_cart.add_item(rice)
joshs_cart.add_item(vaccuum)
joshs_cart.add_item(banana)
joshs_cart.add_item(rice)
joshs_cart.add_item(anchovies)


joshs_cart.checkout