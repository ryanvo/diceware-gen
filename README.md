# Diceware Password Generator

A ruby program to generate diceware passphrases with Random.org.

[Diceware](http://world.std.com/~reinhold/diceware.html),
[Random.org](https://www.random.org/randomness/), [EFF's new wordlists 7-2016](https://www.eff.org/deeplinks/2016/07/new-wordlists-random-passphrases)

## Usage
```shell
./main <path_to_wordlist> <num_of_phrases> <num_of_passwords>
```
## rspec --format documentation

```ruby
Dicegen
  .generate
    when number of passphrases to generate is 0
      should throw an error
    when number of passwords to generate is 0
      should throw an error
    when number of passphrases is n
      should generate passwords with n phrases
    when number of passwords is n
      should generate n passwords
  .new_pass
    should generate a new password with n white-space separated phrases
  .get_random_word
    should generate a random word

PasswordFileLoader
  .create_pair
    should split the string into a pair
  .generate_hash
    for each line
      should add a new pair to the hash

RandomWordService
  .new_word
    should return the word at a random id
  .get_word
    should return the word with the given id
  .random_number
    should return a 5-digit number
    should return digits within a range of 1-6
```
