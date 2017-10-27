# Highly divisible triangular number
# Problem 12
# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
#
# What is the value of the first triangle number to have over five hundred divisors?

# NAIVE SOLUTION IS TOO COMPUTATIONALLY INTENSIVE FOR 500

def divisors_naive(t)
  divisors = [1, t]
  (2..t/2).each do |divisor|
    divisors << divisor if (t / divisor) == (t / divisor.to_f)
  end
  divisors.sort
end

def solve_naive(goal)
  n = 1
  t = n

  res = []
  while res.size < goal
    n += 1
    t += n
    res = divisors_naive(t)
  end

  puts "For #{t} num divisors is: #{res.size}"
end

solve_naive(6)

# ---------------------------------------------------------------- #

# A MORE OPTIMAL WAY TO DETERMINE THE AMOUT OF DIVISORS IS
# BY CALCULATING THE PRIME FACTORS. See:
# https://www.wikihow.com/Determine-the-Number-of-Divisors-of-an-Integer

require 'prime'

def factorize_primes(n)
  return [1] if n == 1
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

def num_divisors(t)
  divisors = factorize_primes(t)
  divisors.uniq.map{ |n| divisors.count(n) + 1 }.inject(&:*)
end

def solve(goal)
  n = 1
  t = n

  while num_divisors(t) < goal
    n += 1
    t += n
  end

  puts "For #{t} num divisors is: #{num_divisors(t)}"
end

solve(500)

# ---------------------------------------------------------------- #

# AN EVEN FASTER SOLUTION ...
# ...