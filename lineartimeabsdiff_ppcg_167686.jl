

X±Y=(s=0;i=j=1;while i<=endof(X);d=abs(X[i]-Y[j]);j>endof(Y)||d<abs(X[i]-Y[j+1])?(s+=d,i+=1):j+=1;end)
