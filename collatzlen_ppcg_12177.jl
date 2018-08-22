

#c=n->n%2>0?
c(n,l=0)=n<2?l:n%2>0?c(3n+1,l+1):c(n/2,l+1)
d(n)=(l=0;while n>1;n=n%2>0?3n+1:n/2;l+=1;end;l)

map(n->println(c(n)), (2, 16, 5, 7, 42,71))
map(n->println(d(n)), (2, 16, 5, 7, 42,71))
