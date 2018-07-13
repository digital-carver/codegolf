
, n input
> i = 0
> isqr/temp0
> icopy1/ncopy/temp1
> icopy2/temp2
> temp3
> exitflag (is isqr lt n)
+[-                 while exitflag not 0
  <<<<<
  +                 increment i
  [>+>+>+<<<-]      make 3 copies of i (destructively)
  >[-<+>]           use one of them (temp0) to restore i

  Squaring by multiplying icopy1 with icopy2:
  >[                while icopy1 not 0
    >[>+<<<+>>-]    copy icopy2 to temp3 and add it to isqr
    >[<+>-]         restore icopy2 from temp3
    <<-             decrement icopy1
  ]
  >[-]              reset temp2 (icopy2) to 0

  Comparing n and isqr:
  <<<<[>>>+>+<<<<-] copy n to ncopy and temp2
  >>>>[<<<<+>>>>-]  restore n from temp2
  <[                while ncopy
    >+              increment temp2 as flag
    <<[>>[-]>+<<<-] if isqr gt 0 reset temp2 (destroys isqr & copies to temp3)
    >>>[<<<+>>>-]   restore isqr from temp3
    <[>>+<<-]       set exitflag to 1 if temp2 was not reset
    <<->-           decrement isqr & decrement ncopy 
    ]
  <[-]              reset isqr (would have been set to negative of n minus isqr)
  >>>>              check the flag and exit if isqr gt n
]
<<<<<-.              decrement i by 1 and output

!

