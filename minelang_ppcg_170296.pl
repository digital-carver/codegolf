

#BEGIN{say'{
#'}/=/;$_=qq|"$`": |;$_.=$'=~s'"'\"'gr;END{say'
#}'}

#$/=' ';$_=<>;say'{
#'.s/(.*)=(.*)/qq|"$1": "|.$2=~s|"|\\"|gr.'",'/emgr.'
#}'

#BEGIN{say'{'}s'"'\"'g;s/(.*)=(.*)/"$1": "$2",/;END{say'}'}


BEGIN{say'{'}s'"'\"'g;/=/&&say qq|"$`": "$'",|;END{say'}'}
