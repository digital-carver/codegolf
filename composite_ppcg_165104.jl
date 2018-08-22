
function primecheck(m)
    all(m%i>0 for i∈2:m-1)
end

function d_(L)
    x = 1
    while any(map(primecheck, L+x))
        x += 1
    end
    return x
end

function a_(n)
    n > 0 || return [2]
    Prev = a_(n-1)
    term = Prev[end] + 1
    while d_([Prev;term]) ≤ d_(Prev)
        term += 1
    end
    return [Prev;term]
end

# a=n->(n>0||return[2];d=L->(x=1;while any(map(m->prod(m%i>0 for i∈2:m-1),L+x));x+=1;end;x);P=a(n-1);t=P[end]+1;while d([P;t])<=d(P);t+=1;end;[P;t])

~L=(x=1;while any(map(m->all(m%i>0 for i=2:m-1),L+x));x+=1;end;x)
!n=n<1?[2]:(P=!(n-1);t=P[end]+1;while ~[P;t]<=~P;t+=1;end;[P;t])
