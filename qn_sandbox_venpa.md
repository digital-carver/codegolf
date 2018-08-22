
# Syllabification and classification (Venpa)

### Introduction

[Venpa](https://en.wikipedia.org/wiki/Venpa) is a form of classical Tamil poetry, based upon certain rules of metric prosody. The complete rules form a context-free grammar, the task here is to test for a tiny subset of those rules. 

### Letters

* Vowels: a, A, i, I, u, U, e, E, y, Y, o, O, W
 - small case represents "short" vowels, CAPS represent "long" vowels
 - `y` represents the y sound in "my".
 - `W` represents the "ou" sound in "mouse", and always comes in capital (long) form.
* Consonant: everything else
 - the consonants can be in small case or capitals, whichever is convenient.

### Word Segmenting 

Words in the input are seen as composed of segments (which roughly correspond to the usual notion of a syllable). A segment divide occurs where:    

* two or more consonants occur together, `tr`, `rpp`, etc.      
* a long (capital) vowel occurs in the word, `pO`, `W`, `mY` etc.     
* two vowels have occurred since the last segment's end (or the word's beginning). 

`sanjIvi` has segments `san`, `jI`, `vi`.     
`Yvar` has `Y`,`var`.         
`vigadakavi` has `viga`,`daka`,`vi`.      
`vAnily` has `vA`,`nily`.        
`padAgytAngiha` has `padA`, `gytAn`, `giha`         
`radagajaturagapadAdi` has `rada`, `gaja`, `tura`, `gapa`, `dA`, `di` 

(Consonants at the end of segments make no difference after segmentation and can be ignored - `gytAn`=`gytA`, `var`=`va`.)

As you can see, the segments are of two types: 

1. those with a single vowel, `san`, `Y`, `vA`, called a straight (S) segment
2. those with two vowels, `viga`, `nily`, `padA` called a sequence (Q) segment

So the segment patterns of the above words are:

      sanjIvi              =              san + jI + vi          = SSS
      Yvar                 =                 Y + var             = SS
      vigadakavi           =            viga + daka + vi         = QQS
      vAnily               =                vA + nily            = SQ
      padAgytAngiha        =           padA + gytAn + giha       = QQQ
      radagajaturagapadAdi = rada + gaja + tura + gapa + dA + di = QQQQSS

### Permitted patterns 

The rules for words allowed in a Venpa are:

1. a word should have one to three segments
2. a one or two segment word can have any pattern (S, Q, SQ, SS, QS, QQ)
3. a three segment word must end in a straight (S) segment

So out of the above, SSS, SS, QQS, and SQ are allowed, QQQ and QQQQSS are not. 

### Task

Given an input word in the above letters, output its segment pattern if it's an allowed word, 
or a false-y value if it's not an allowed word. 

### Input

* Will be a single word composed of the characters mentioned under the Letters heading above
  - (Small case `w` will *not* be present anywhere in the text (neither as a vowel nor as a consonant))

### Output

* The segment pattern of the input word, if it's an allowed word
  - can use any two distinct unambiguous characters to represent S segments and Q segments
* A false-y value in your language if it's not an allowed word
* Output is undefined for invalid input (i.e. has characters other than those specified)

### Test cases

    vigadakavi 
    => QQS
    Yvar 
    => SS
    padAgytAngiha
    => falsey (QQQ not allowed)
    vAnily
    => SQ
    katradanA
    => SQS
    radagajaturagapadAdi 
    => falsey (more than 3 segments)
    TuppArkkuT
    => SSS
    mazai
    => Q

