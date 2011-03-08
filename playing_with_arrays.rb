array1 = [1, 2, 3, 4]
array2 = %w{peter piper picked peppers}

class ArrayTesting
  
  def test(array3)
    if array3 == ['1', 'peter', '2', 'piper', '3', 'picked', '4', 'peppers']
      "A Total Success"
    else
      "A Complete Failure"
    end
  end
    
end

#this is an attempt to understand procs/lambdas, I wanted to be able to throw a code block into the test class and give the result

attempt1 = lambda do |array1,array2|
 array3 = []
  4.times do |i|
  array3 << array1[i].to_s
  array3 << array2[i]
  end
 return array3
end

attempt2 = lambda {|array1, array2 | (array1 + array2).map{|x| x.to_s}.shuffle} #just for fun
attempt3 = lambda {|array1,array2| array1.map {|x| x.to_s}.zip(array2).flatten}
 
puts "The result for attempt number 1 is #{ArrayTesting.new.test(attempt1.call(array1,array2))}"
puts "The result for attempt number 2 is #{ArrayTesting.new.test(attempt2.call(array1,array2))}"
puts "The result for attempt number 3 is #{ArrayTesting.new.test(attempt3.call(array1,array2))}"

p attempt2.call(array1,array2)

