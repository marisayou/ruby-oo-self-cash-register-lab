class CashRegister
    attr_accessor :discount, :total
    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
        @transactions = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        for i in 0...quantity
            @items << title
        end
        @transactions << [title, price, quantity]
    end

    def apply_discount
        if @discount > 0
            @total *= (1 - @discount.to_f/100)
            return "After the discount, the total comes to $#{@total.round}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        last_transaction = @transactions[-1]
        @transactions.pop()
        @total -= last_transaction[1]*last_transaction[2]
        if @transactions.length == 0
            @total = 0
        end

        for i in 0...last_transaction[2]
            @items.pop()
        end
    end

end
