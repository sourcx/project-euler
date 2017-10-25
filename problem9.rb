# Special Pythagorean triplet
# Problem 9
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# I don't like this solution
(1..998).each do |a|
  (1..998).each do |b|
    (1..998).each do |c|
      if a + b + c == 1000 && a*a + b*b == c*c
        puts "Special Pythagorean triplet is #{a}, #{b}, #{c}."
        puts "Product is #{a * b * c}"
        exit
      end
    end
  end
end
