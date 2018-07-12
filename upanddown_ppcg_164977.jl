

u = n->((s,S,x)=(1,[],0);for i∈2:n^2+1;S=[S;x];(x+s)^2<-~i||(s=-s);x+=s;end;[S;x])

println(u(2), u(4))

