
#https://codegolf.stackexchange.com/q/162231/8774

function c_ungolfed(f,n,a=[])
    if n > 1
        return x->c(f, n-1, [a;x])
    else
        return x->f(a...,x)
    end
end

#golf
c = (f,n,a=[])->n>1?x->c(f,n-1,[a;x]):x->f(a...,x)

function f(a, b, c)
    return a + b * c
end

hi(a,b,c,d) = "Hello, $a, $b, $c, and $(d)!"

gg = c_ungolfed(f, 3)
g = c(f, 3)
println(gg(2)(5)(8))
println(g(2)(5)(8))

g = c(hi, 4)
println(g("Hari")("Uma")("Prem")("Bheem"))
