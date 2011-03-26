class WordMath
  
  def initialize(number)
    @number = number
  end
  
  def double
    @number * 2
  end
  
  def treble
    @number * 3
  end
  
  def square
    @number **2
  end
  
  def cube
    @number **3
  end
  
  def half
    @number / 2.0
  end
  
  def quarter
    @number / 4.0
  end
  
end

class Tester
  
  def initialize()
    @number = 8
  end
  
  def test_maths
    raise "Double is broken" unless WordMath.new(@number).double == 16
    raise "Treble is broken" unless WordMath.new(@number).treble == 24
    raise "Square is broken" unless WordMath.new(@number).square == 64
    raise "Cube is broken" unless WordMath.new(@number).cube == 512
    raise "Half is broken" unless WordMath.new(@number).half == 4
    raise "Quarter is broken" unless WordMath.new(@number).quarter == 2
    puts "All tests were successful"
  end

end

test = Tester.new.test_maths
    
    
    
    
    
    
    
    
    
  
  
  