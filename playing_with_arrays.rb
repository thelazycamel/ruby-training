array1 = [1, 2, 3, 4]
array2 = %w{peter piper picked peppers}
array3 = []


#attempt number 1 (across multiple lines)
array1.each do |position|
  array3 << array1[position -1].to_s
  array3 << array2[position -1]
end

#attempt number 2 (on one line) - tough so shuffle them up and hope for the best :)
array3 = (array1 + array2).map{|x| x.to_s}.shuffle

#attempt number 3 (on one line) - the most complicated one-line ive ever done - i guess thats what you meant by zip it?
array3 = array1.map{|x| x.to_s + "," + array2[x-1].to_s + ","}.join.split(",")

puts array3.inspect


if array3 == ['1', 'peter', '2', 'piper', '3', 'picked', '4', 'peppers']
  puts "Success"
else
  puts "Failed"
end