# Number letter counts
# Problem 17
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
class Fixnum
  WORDS = {  1 => 'one',         2 => 'two',
             3 => 'three',       4 => 'four',
             5 => 'five',        6 => 'six',
             7 => 'seven',       8 => 'eight',
             9 => 'nine',       10 => 'ten',
            11 => 'eleven',     12 => 'twelve',
            13 => 'thirteen',   14 => 'fourteen',
            15 => 'fifteen',    16 => 'sixteen',
            17 => 'seventeen',  18 => 'eighteen',
            19 => 'nineteen',   20 => 'twenty',
            30 => 'thirty',     40 => 'forty',
            50 => 'fifty',      60 => 'sixty',
            70 => 'seventy',    80 => 'eighty',
            90 => 'ninety',    100 => 'hundred' }

  def spoken_in_words
    n = self

    res = ''

    if n / 1000 > 0
      res += WORDS[n / 1000]
      res += " thousand "
      n -= (n / 1000 * 1000)
    end

    if (n / 100) > 0
      res += WORDS[n / 100]
      res += " hundred"
      n -= (n / 100 * 100)
      res += " and " if n != 0
    end

    if n > 20
      res += WORDS[(n / 10) * 10]
      n -= (n / 10 * 10)
    elsif n > 0
      res += WORDS[n]
      n -= n
    end

    res += "-#{WORDS[n % 10]}" if n > 0

    res
  end

  def spoken_size
    spoken_in_words.gsub('-', '').gsub(' ', '').size
  end
end


puts (1..1000).map(&:spoken_size).inject(&:+)
