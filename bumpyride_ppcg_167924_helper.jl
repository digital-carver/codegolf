

function iszigzag(s)
  codepoints = [s...]
  dirs = sign.(diff(codepoints))
  all(dirs .!= 0) & all(diff(dirs) .!= 0)
end

#=

MATL code:
dt?ZSd]pA

Explanation:
d    %take the difference between successive elements of input
t    %duplicate that
?    %if that is all non-zero
  ZS %take the sign of those differences (so input is all `-1`s and `1`s now)
  d  %take the difference of that (so if there are successive `1`s or `-1`s, this will have a 0)
]    %end-if
p    %take the product of topmost stack vector (will be 0 if either the original difference or 
     % the difference-of-signs contained a 0)
A    %convert positive products to 1, zeros remain as is
     %(since OP specifies "you should output one of two different consistent values for each possibility ")

=#

