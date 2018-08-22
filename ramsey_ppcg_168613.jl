
f = 
A->((r,s)=sort(A);r<3?s^~-r:3r+(s^2-4s+3)*((r==s)+r-2)-3)


function f_(A)
  (r, s) = sort(A)

  if r < 3
    result = s^(r-1)
  else
    result = 3*r + 
               (s^2 - 4*s + 3) * ((r == s) + r - 2) -
               3
  end

  return result
end


println([f([r, s]) for r in 1:5, s in 1:5])
println([f_([r, s]) for r in 1:5, s in 1:5])
