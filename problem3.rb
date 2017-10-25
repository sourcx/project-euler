# Largest prime factor
# Problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143
#
# In this exercise I'm doing prime factorization of n = 600851475143 by dividing n
# as many times by each prime numbers in ascending order.
#
require 'prime'

def factorize_primes(n)
  remainder = n
  factors = []

  Prime.each(n) do |prime|
    while (remainder / prime) == (remainder / prime.to_f)
      factors << prime
      return factors if factors.inject(&:*) == n
      remainder = (remainder / prime)
    end
  end
end

# p factorize_primes(13195)
# p factorize_primes(600851475143)

puts "Largest factor is: #{factorize_primes(600851475143).max}"