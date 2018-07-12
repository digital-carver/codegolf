

#=

Minimum product of 

=#

function mps(r)
    s = for n in r
        n
    end
    s
end

map(r->println(mps(r)), (2:9, 12:18, ))
