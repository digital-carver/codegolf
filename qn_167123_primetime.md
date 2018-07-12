
# Prime Time Travel

Don't tell anyone, but I've nicked my uncle's time travel machine! My uncle is obsessed with prime numbers though, and that shows in the machine - he has programmed it so that it can only go to dates that sum up to a prime number. 

So it can't go to `1947-08-15` because 1947+8+15 = 1970 which is not a prime number. It *can* go to `1947-07-25`, because 1947+7+25 = 1979 which is prime. So if I want to go back to watch India's independence celebrations, it looks like I'll have to go a few weeks earlier and wait out those 20 days. 

I have some other dates that I want to go to, and I'll similarly have to go to a date before (or if I'm lucky, equal to) my target date, that sums up to a prime number. I'm impatient though, and don't want to wait too much - so I want to find the date I can use that is closest to my target date.

**Can you write me a program that takes my target date and gives me the date I should input into the time machine - the closest date before or equal to the given date, whose parts add up to a prime number?**

(For this challenge, we're using the *proleptic* Gregorian calendar - which simply means we use the current Gregorian calendar even for periods when people then were using the older Julian calendar.)

### Input

* A date
 - ideally, any date in the Current Era (AD); practically, whatever subset of that your language can naturally handle
 - in any single human-readable format⁺ you like    

### Output

* The date closest to the input date, which is less than or equal to the input and whose date+month+year sums up to a prime number. 
  - in any single human-readable format⁺ you like    

⁺: "human readable" as in the day, month and year all separately spelt out, in whatever order

### Test cases

    1947-08-15
    => 1947-07-25
    1957-10-04
    => 1957-09-27
    1776-07-04
    => 1776-07-04
    999-12-12
    => 0999-12-10
    2018-06-16
    => 2018-06-15

*(Thanks to @Shaggy and @PeterTaylor for help with the question in the Sandbox.)*
