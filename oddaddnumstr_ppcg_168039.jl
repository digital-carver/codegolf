
#f = s->(s=[replace(s,r"\D","")...].-'0';endof(s)>0?sum(2(s%2).*[s[2:end];s[]]):0)

f = s->(s=s.-'0';s=s[0.<=s.<=9];endof(s)>0?sum(2(s%2).*[s[2:end];s[]]):0)

map(s->println(f([s...])), (
      "r5e6o9mm!/3708dvc",
      "12345",
      "asf",
      "abc1xy",
      ))

