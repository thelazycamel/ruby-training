#!/usr/local/bin/ruby -w

puts "Hello, Ruby Programmer"
puts "It is now #{Time.now}"

myline = "this has fred in it"

def find_ruby(line)
  if line =~ /ruby|python|perl/
    puts "You gotta progamming language there"
  else
    puts "What you got"
  end
end

find_ruby(myline)
