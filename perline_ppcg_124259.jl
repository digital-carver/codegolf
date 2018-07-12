
## Prints the output, 5 bytes per line
f=#
n->#
((i,#
a=#
"A"*#
"p"*#
"p"*#
"l"*#
"e",#
p=#
"P"*#
"i"*#
"e"#
)->#
["$i
","$a
","$p
",a*#
p*"
"][#
1+(i#
%3<1#
)+2(#
i%5<#
1)]#
|>[#
print
sin#
][1]#
).(#
1:n)

function f_ungolfed(n)
  inner = (i,
           a="Apple",
           p="Pie") -> ["$i\n",
                        "$a\n",
                        "$p\n",
                        a*p*"\n"][
                                    1 + (i%3 < 1) + 2(i%5 < 1)
                                   ] |> [print; sin][1]
  inner.(1:n)
end

## Returns the output, 4 bytes per line
g=#
n->#
((i#
,a=#
"A"#
*#
"p"#
*#
"p"#
*#
"l"#
*#
"e"#
,p=#
"P"#
*#
"i"#
*#
"e"#
)->#
[i,#
a,p#
,a*#
p][#
1+(#
i%3#
<1#
)+#
2(i#
%5<#
1)]#
).(#
1:n#
)

if !isinteractive()
  f(16)
  f_ungolfed(16)
  println(g(16))
end
