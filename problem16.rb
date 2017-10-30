# Power digit sum
# Problem 16
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

# res = (2**1000).to_s.each_char.reduce(0){ |sum, n| sum += n.to_i }
res = (2**1000).to_s.each_char.map(&:to_i).inject(&:+)
puts "Sum of the digits of 2^1000 is #{res}."
