class BookInStock
  
  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end

end


book1 = BookInStock.new("isbn1", 3)
book2 = BookInStock.new("isbn2", 3.45)