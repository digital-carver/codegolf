
# https://codegolf.stackexchange.com/q/166802/8774

function daycount(dateranges)
    t = Dict{Date, Int}()
    for drange in dateranges, d in drange
        if d∈keys(t)
            t[d] += 1
        else
            t[d] = 1
        end
    end

    result = Int[]
    for d in minimum(keys(t)):maximum(keys(t))
        if d∈keys(t)
            push!(result, t[d])
        else
            push!(result, 0 )
        end
    end
    result
end

c = R->(t=Dict();[[d∈keys(t)?t[d]+=1:t[d]=1 for d∈g]for g∈R];[d∈keys(t)?t[d]:0 for d∈min(keys(t)...):max(keys(t)...)])
n = R->(t=Dict();[[d∈keys(t)?t[d]+=1:t[d]=1 for d∈g]for g∈R];[try;t[d];end for d∈min(keys(t)...):max(keys(t)...)])

const dateranges = [
                    Date("2001-01-01"):Date("2001-01-01"),
                    Date("2001-01-01"):Date("2001-01-03"),
                    Date("2001-01-01"):Date("2001-01-02"),
                    Date("2001-01-03"):Date("2001-01-03"),
                    Date("2001-01-05"):Date("2001-01-05"),
                   ]

r = T->(t=Dict();f=(x,y)->(y<T[1][1]||f(x,y-Dates.Day(1));t[y]=(x<=y)+(y∈keys(t)&&t[y]));[f(x,y)for(x,y)∈T];[t[d]for d∈T[1][1]:max(keys(t)...)])

#=
These assume that the start of the first range is the lowest date AND the end of the last range is the highest - but that's sometimes not possible even if the OP allows us to take sorted input. For eg. if input is [(2001-01-01, 2001-01-05), (2001-01-02, 2001-01-03)]. Unless OP allows us to split and rearrange these ranges during preprocessing (which seems unlikely), this input can't be processed by this code properly.
=#
function daycount_sortedin(dateranges)
    d = first(dateranges[1])
    while d <= last(dateranges[end])
        println(sum(d in r for r in dateranges))
        d += Dates.Day(1)
    end
end
s = R->(d=first(R[1]);while d<=last(R[end]);println(sum(d∈r for r∈R));d+=Dates.Day(1);end)
t = T->(d=T[1][1];while d<=T[end][2];println(sum(d∈a:b for (a,b)∈T));d+=Dates.Day(1);end)

const datetuples = [
                    (Date("2001-01-01"), Date("2001-01-01")),
                    (Date("2001-01-01"), Date("2001-01-03")),
                    (Date("2001-01-01"), Date("2001-01-02")),
                    (Date("2001-01-03"), Date("2001-01-03")),
                    (Date("2001-01-05"), Date("2001-01-05"))
                   ]

m = M->[println(sum(d∈M[r,1]:M[r,2] for r∈1:size(M,1))) for d∈M[1]:M[end]]

const datematrix = [
                    Date("2001-01-01") Date("2001-01-01")
                    Date("2001-01-01") Date("2001-01-03")
                    Date("2001-01-01") Date("2001-01-02")
                    Date("2001-01-03") Date("2001-01-03")
                    Date("2001-01-05") Date("2001-01-05")
                   ]

if !isinteractive()
    #println(daycount(dateranges))
    #println(c(dateranges))
    #println(n(dateranges))
    #daycount_sortedin(dateranges)
    #s(dateranges)
    #t(datetuples)
    println(r(datetuples))
    m(datematrix)
end

