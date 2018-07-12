
g = V->(¬W=W==[]?0:∪([n=W[] -n].+¬W[2:end]))(V)|>endof

function g_(V)
  function inner(W)  #named ¬ in golf version to save bytes
    W == [] ? 0 :    #return 0 when input empty (base case)
    ∪(               #unique elements of
      [n=W[] -n]     #take the first element and its negation
      .+             #broadcast-add that to each element of
      inner([2:end]) #sign-swapping sums of the rest of the array
     )
  end                #returns the list of unique elements out of those sums
  return endof(inner(V)) #return the length of that list
end

f = N->endof(∪([2(i&2^~-j>0)-1 for i=0:~-2^(l=endof(N)),j=1:l]*N))

function f_(N)
  endof(                            #length of
        ∪(                          #unique elements of
          [
           (i & 2^(j-1) > 0)        #check j'th bit (from right) of i
           * 2 - 1                  #convert bit value from (0,1)=>(-1,1)
           for i = 0:2^endof(N)-1,  #where i is numbers 0 to 2^length(N)-1
           j = 1:endof(N)           #and j is 1 to length(N) (i.e. the bits in i)
          ]                         #so we have a matrix [-1 -1 -1;1 -1 -1;1 -1 1;...]
          *                         #matrix multiply that with the input array, 
          N                         #thus calculating different combinations of 
         ))                         #sign-swapping sums
end


