# Lattice paths
# Problem 15
# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
# there are exactly 6 routes to the bottom right corner.
#
# How many such routes are there through a 20×20 grid?

# Got some information from https://stackoverflow.com/a/2200323/2641483
# This problem can be seen as follows:
#   We have 40 steps, see them as the elements in a set.
#   20 of these steps go right (or down)
#   We have to pick them all out of the set in a specific order
#   How many different ways can pick 20 elements from the set?
#
# Solution to this is binomial coefficient
# ( 40 )          40!              40!
# (    )  =  -------------  =  ----------  =
# ( 20 )      20!(40-20)!       20!(20!)

puts "There are #{(21..40).inject(&:*) / (1..20).inject(&:*)} routes in the 20x20 grid."
