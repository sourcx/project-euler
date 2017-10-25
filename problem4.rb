# Largest palindrome product
# Problem 4
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

class Fixnum
  def is_palindrome?() self.to_s == self.to_s.reverse end
end

def largest_palindrome_product(len)
  highest = ("9" * len).to_i
  lowest = ("1" + "0" * (len - 1)).to_i
  this, that = highest, highest
  res = 0

  this.downto(lowest).each do |l|
    that.downto(lowest).each do |m|
      if (l * m).is_palindrome? && (l * m) > res
        res = (l * m)
      end
    end
  end

  res
end

# p largest_palindrome_product(2)
# p largest_palindrome_product(3)

puts "Largest palindrome product is: #{largest_palindrome_product(3)}"