

const testcase1 = """
a = 2
b = 3
for i in 0:9  
  b = b - 10
end
if a == b
  print("a equals b")
end
"""

!s=try;Meta.parse(s);end
