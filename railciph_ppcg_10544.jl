
# v0.7

!M=(M[2:2:end,:]=reverse(M[2:2:end,:],dims=2);M)
s|n=replace(String((!permutedims(reshape([rpad(replace(s,Regex("(.{$n})(.{1,$(n-2)})")=>s"\1ø\2ø"),length(s)*n,'ø')...],n,:)))[:]),"ø"=>"")

# s|n=String(filter(!in('ø'),(!permutedims(reshape([rpad(replace(s,Regex("(.{$n})(.{1,$(n-2)})")=>s"\1ø\2ø"),length(s)*n,'ø')...],n,:)))[:]))


