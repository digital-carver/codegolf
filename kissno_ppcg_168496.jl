

using MLBase

#Kissing numbers 
KN = 
[1           2               2
2           6               6
3           12              12
4           24              24
5           40              44
6           72              78
7           126             134
8           240             240
9           306             364
10          500             554
11          582             870
12          840             1357
13          1154            2069
14          1606            3183
15          2564            4866
16          4320            7355
17          5346            11072
18          7398            16572
19          10668           24812
20          17400           36764
21          27720           54584
22          49896           82340
23          93150           124416
24          196560          196560]
x = KN[:, 1];
l = KN[:, 2];
u = KN[:, 3];
m = (l .+ u) ./ 2;
r = x[8:24];  # the range that has apparently exponential growth

function estfun(a, b, c)
    @. a * exp(b*r) + c
end

function evalfun(mcalc)
    count(l[r] .<= mcalc .<= u[r])
end

res = gridtune(estfun, evalfun, 
    ("a", -100:100),
    ("b", -1:0.01:1),
    ("c", -10000:1000:10000),
    # (9, 0.41, 0) from simple count as evalfun
    # well, also with:
    # count(l[r] .<= mcalc .<= u[r]) - sum(abs.(2*(mcalc[[1,end]] .- l[r[[1,end]]])./l[r[[1,end]]]))
    # and a few others
    # gives values within range (after ceil) for x[8:23]
    # another: (5.0, 0.44, 100)
    # another: (6.0, 0.43, 60)
)

# for range [1:8], (2, 0.6, 0) matches (after floor) all but 1, 4, 8 
# for 1:7, (3.7, 0.51, -5.1) matches (after ceil) all

function f_(n)
  ceil(n<8?3.7exp(.51n)-5.1:n<24?9exp(.41n):196560)
end

f = n->ceil(n<8?3.7exp(.51n)-5.1:n<24?9exp(.41n):196560)

