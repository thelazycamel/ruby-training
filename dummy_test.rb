require "dummy"

10.times do |variable|
  puts "dummy motto number #{variable + 1}= #{Dummy.magic_data("phone", :integer)}"
end
