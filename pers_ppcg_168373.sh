# bash, 10 bytes (non-competing)

#    touch $@
#    ls

# Unix filenames [can contain][1] any character except `NUL` and `/`, and their names can be [upto 255 bytes long](https://serverfault.com/a/9548/188067) so this will be able to store only strings up to that length (consider that a limitation of the storage medium), and that don't contain '/' in them. That's one reason this is non-competing, another is that this assumes the directory it's run on is empty (or that extraneous output from `ls` is allowed). I still wanted to post this because it just seemed a cool and non-obvious way to store information. 

# Another on a similar vein, which wouldn't have the same length and character limitations would be:

## 35 bytes

#    mkdir -p $@
#    find|sed '$!d;$s/^..//'
#
#This allows the `/` character in the string, and supports many more characters (exactly how many depends on implementation). 
#
#  [1]: https://unix.stackexchange.com/a/230299/43499

#from: https://codegolf.stackexchange.com/a/168373/8774

