require 'test/unit'

class List
  
  def initialize(max=nil)
    @list = []
    @max = max
  end

  def size
    @list.size
  end
  
  def add(item) 
    raise RuntimeError if @max && @max <= (@list.size)
    @list << item
    puts "item name = #{item} and size =#{@list.size} and max size = #{@max}"
    
  end
  
  def to_s
    @list.join(", ")
  end
  
end


class BasicListTest < Test::Unit::TestCase
  
  def setup
      @list = List.new
  end
  
  def test_basic_list_object_can_be_created
    assert_equal List, @list.class
  end
  
  def test_empty_list_has_zero_size
    assert_equal 0, @list.size
  end
  
  def test_can_add_items_to_a_list
    @list.add('test')
    assert_equal 1, @list.size
    @list.add('test2')
    assert_equal 2, @list.size
  end
  
  def test_lists_have_good_string_representations
    @list.add('test')
    @list.add('test2')
    assert_equal "test, test2", @list.to_s
  end
  
  def test_list_can_have_a_max_size_passed
    list = List.new(4)
    list.add('test')
    list.add('test2')
    list.add('test3')
    list.add('test4')
    assert_raise(RuntimeError) { list.add('test5') }
  end
  

  
end