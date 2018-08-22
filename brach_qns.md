# Answered

* I didn't expect this to work as is, but why does it fail immediately instead of going into infinite backtracking or something? - `,.d~⟦₁~⌉?∧`
  - should be `;.c`, and even then `d` doesn't work properly with uninstantiated data

* `∧ℕ₁;0P&,P` with input X and output [2,1,3,7,0] (https://tio.run/##SypKTM6ozMlPN/r//1HH8kctUx81NVobBKjpBPz/H/E/2kjHUMdYx1zHIBYA) - why doesn't this print X = [2, 1, 3, 7]
  - again comma issue (comma on unknown data only tries []), `∧ℕ₁;0P&;Pc` returns [2, 1, 3] as it should

* Why does https://tio.run/##SypKTM6ozMlPN/r/v@ThzvZHTY3hahnW4VXVJUFqGTp6QY86lteeXvT/f3S0UhpQrVKsjgKYkZ2Zl64AYpQk5hRDGKkpEDozPy8xRyG5tKgoNS@5EkksB8EBqs3MK8mH8UuhRuQXlxQllmQmQ3ilRanFCsmJpcUguwpLM0tSFRLBMonFSrH/owA fail quickly? 
  - another victim of the common comma

* Why does [Try it online!](https://tio.run/##SypKTM6ozMlPN/r//1HHcst0Hftq@4e7OmsfNW581Ljv//9oIx0F49j/UQA "Brachylog – Try It Online") print the list reversed ([2, 9] instead of [9, 2])?
* Is order returned by `m`ap not guaranteed? [Try it online!](https://tio.run/##SypKTM6ozMlPN/r/X8egukT7UVOjp9qj@cuA9MOtEx417tPxVIh4uKszQqH2UePGR417obyHOxdC5P//jzbWUTCK/R8FAA "Brachylog – Try It Online") (related to "length mapping" question)
  - seems related to the [2, 9] issue above
  - Yep, both stem from the same basic bug. Found and fixed, yay!



# Tips

* Use inline predicates to save bytes. https://codegolf.stackexchange.com/a/169403/8774

* When you want to check that a list is either empty or contains only a particular value as all of its elements, use `;VxĖ` (where V is the value in the list). https://codegolf.stackexchange.com/a/170426/8774


# Yet to ask

* What do parantheses do? Example?

* `[],5<₁` fails, though `[5]<₁` succeeds. 


* Why does [Try it online!](https://tio.run/##ATQAy/9icmFjaHlsb2cy//90UyZofmzhuZnigoHhtZAuIFjhuolYICtT4oin//9bNSwgMi4wXf9a "Brachylog – Try It Online") backtrack exactly 4 times before failing? Probably some fundamental lack of understanding of ṙ₁ on my part. 

* Why does this not terminate: [Try it online!](https://tio.run/##SypKTM6ozMlPN/r/v6744dbZSrn5Rak5uYl5mYnJSv//R4P5SjoKSkBBEAWVif0fBQA "Brachylog – Try It Online") (related to Portmanetout qn)

* Why does disconcatenation on numbers also return negative values? https://tio.run/##SypKTM6ozMlPN/r/vy754bYFjxp3/v9vaGRsYmpmbmH5PwoA

* Difference between zip and transpose?


