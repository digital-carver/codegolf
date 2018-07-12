#/ =÷
#show(sum(sum.(digits.(1:eval(parse(ARGS[]))))))
##show(sum(sum(digits(d))for d=1:eval(parse(ARGS[]))))

/ =÷
!n=n<=9?(n+1)n/2:(v=n/(t=10^(d=big(ndigits(n)-1))))*45d*10^~-d+t*(v-1)v/2+(1+n%t)v+!(n%t)
isinteractive() || show(!eval(parse(ARGS[])))

println()


# reassign float division to integer division (for the eval and to save bytes otherwise)
/ =÷
function f_(n::BigInt)
  # necessary as a base case for the recursion
  n <= 9 && return (n+1)n/2
  d = big(ndigits(n)-1)
  # highest power of ten that's less than n
  # say n is 4895, then t = 1000
  t = 10^d
  # get first digit of n (v = 4 in this case)
  v = n/t
  # initialize digit sum
  s = big(0)
  # there have been 1000 1's, 1000 2's, and 1000 3's as first digits of numbers so far,
  #  add those to the digit sum
  s += t*(v-1)v/2
  # now that the first digits upto 3999 are taken care of, handle the other digits
  # digits in 0 to 3999 = digits in 0000 to 0999 + in 1000 to 1999 +
  # in 2000 to 2999 + in 3000 to 3999
  # once first digits are taken care of, that becomes four times the digits in 0 to 999
  # in 0 to 999, 6 occurs 100 times in hundreds digit (600-699),
  # 100 times in tens digit (x60 to x69, for x from 0 to 9),
  # 100 times in ones digit (xy6 for x from 0 to 9, for y from 0 to 9)
  # so 6 occurs 3*10^2 times in 0 to 999, or in general d*10^(d-1) times
  # so sum of 6s in 0 to 999 is 6d*10^(d-1), and since we have to consider
  # that range four times, sum in 0 to 3999 is 4*6d*10^(d-1)
  # same logic applies for the other digits, so the sum of all non-first digits
  # in this range (0 to 3999) is: 4*1d*10^(d-1) + 4*2d*10^(d-1) + ... 4*9d*10^(d-1)
  # = 4*(1+2+...+9)*d*10^(d-1) = 4*45d*10^(d-1)
  # or in general, v*45d*10^(d-1)
  s += v*45d*10^(d-1)
  #sum of digits up to 3999 has been taken care of

  # now sum from 4000 to 4895
  # there are 896 4s in the first digit in this range, so sum of those is 4*896
  # or in general, v*(1 + n%t)
  s += v*(1+n%t)
  # first digit taken care of, now call this function recursively to find sum of 
  # digits in 0 to 895 (which is all that remains to be summed)
  s += f_(n%t)
end
isinteractive() || show(f_(big(eval(parse(ARGS[])))))

