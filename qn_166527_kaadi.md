#https://codegolf.stackexchange.com/q/166527/8774

You have come across an old Indian manuscript, one that describes mounds of buried treasure. The manuscript also tells you the location of the treasure, except that some crucial numbers have been encoded indirectly into the text. You figure out that the text uses a 'Kaadi' system, a restricted subset of the more common 'Katapayadi' system. 

(The [Katapayadi](https://en.wikipedia.org/wiki/Katapayadi_system) system is an ancient Indian system to encode numerals as letters, often used as mnemonics to remember long numbers.)

Your task here is to decode text encoded in the Kaadi system and print out the numerical value. 

### Details

**Input characters**

The Kaadi system is based on the [Katapayadi system's rules](https://en.wikipedia.org/wiki/Katapayadi_system#Rules_and_practices), but uses only the first row of consonants. Your text here has been transliterated to Latin alphabet, and is known to contain only: 

* vowels 'a','e','i','o','u'
* consonants 'g','k','c','j', and their capital forms (to represent the [aspirated](https://en.wikipedia.org/wiki/Aspirated_consonant) form of those consonants), and 'ṅ' and 'ñ'. 

(You may choose to receive and handle 'ṅ' as 'ng' and 'ñ' as 'ny' if that's more convenient in your language.)

**Value assignment**

In this system, 

1. each consonant when followed by a vowel has a digit associated with it. These are: 

     `'k'=>1, 'K'=>2,`    
    `'g'=>3, 'G'=>4,`    
    `'ṅ'=>5,`    
    `'c'=>6, 'C'=>7,`    
    `'j'=>8, 'J'=>9,`    
    `'ñ'=>0`    

*Note however, that these values apply only when these consonants are followed by a vowel.* `kacCi` has the same value as `kaCi` (`ka`,`Ci`=(1,7)) since the middle c is unaccompanied by a vowel.     

2. Additionally, an initial vowel or sequence of two vowels represents a 0. `aikaCi` would be: `ai`,`ka`,`Ci` = (0,1,7)
 
3. Extra vowels anywhere else in the middle of the text have no value: `kauCia` is the same as `kaCi`, the extra vowels can be ignored.

**Final numeric value**

Once the digit values of the letters have been figured out, the final numerical value is obtained as the reverse order of those digits i.e. the first digit from the text is the least significant digit in the final value. 

Eg.   
`GucCi` has `Gu` and `Ci`, so (4, 7), so the final value is 74.     
`kakakaGo` is (1,1,1,4), so the the answer is 4111.      
`guṅKo` is (3,2), so encodes 23. (`gungKo` if using ASCII-equivalent.)


### Input 
* A string containing a Kaadi-encoded text
  - will contain only vowels and the above consonants
  - the vowels are always in lowercase
  - you may choose to accept the letters for 5 and 0 either as their Unicode characters 'ṅ' and 'ñ' or as their ASCII equivalents 'ng' and 'ny' (they're in lowercase in either form)
  - you may assume there are no spaces or punctuations

### Output
* The numerical value of the text, as given by the above rules
  - for empty input, an empty output or any false-y output in your language of choice is acceptable, in addition to 0
  - for invalid input (input with anything other than vowels and the above consonants), the output is undefined - anything goes

### Test cases

    "GucCi"
    => 74
    "kakakaGo"
    => 4111
    "aiKaCiigukoJe"
    => 913720
    ""
    => 0 //OR empty/falsey output
    "a"
    => 0
    "ukkiKagijeCaGaacoJiiKka"
    => 1964783210
    "kegJugjugKeg"
    => 2891
    "guṅKo"
    => 23
    "Guñaaka"
    => 104
(the last two can be:

    "gungKo"
    => 23
    "Gunyaaka"
    => 104

if you prefer that.)

Standard rules for [I/O](https://codegolf.meta.stackexchange.com/q/2447/73884) and [loopholes](https://codegolf.meta.stackexchange.com/q/1061/73884) apply. May the best golfer win!

