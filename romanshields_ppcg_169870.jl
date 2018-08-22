

!n=(s=isqrt(n))*s+4s+(n>0&&!(n-s*s))

!n = begin       # Assign to ! operator to save bytes on function parantheses
  s = isqrt(n)   # Integer square root: the largest integer m such that m*m <= n
  s * s +
    4 * s +
      (n > 0 &&  # evaluates to false = 0 when n = 0, otherwise recurses
        !(n - s * s))
end
