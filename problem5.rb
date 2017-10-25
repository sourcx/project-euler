# Smallest multiple
# Problem 5
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

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

factors = []

(2..20).each do |n|
  primes = factorize_primes(n)

  primes.uniq.each do |prime|
    primes.count(prime)
    while factors.count(prime) < primes.count(prime)
      factors << prime
    end
  end
end

puts "The smallest number divided by (1..20) is #{factors.inject(&:*)}"
