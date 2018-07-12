

function prime_date_before(targetdate)
    curdate = targetdate
    while !isprimedate(curdate)
        curdate -= Dates.Day(1)
    end
    curdate
end

function isprimedate(d)
    n = Dates.day(d) + Dates.month(d) + Dates.year(d)
    for i in 2:isqrt(n)
        n % i == 0 && return false
    end
    return true
end

isinteractive() || println(prime_date_before(Date(ARGS[1])))

