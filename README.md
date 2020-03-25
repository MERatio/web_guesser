# Web Guesser

A number guessing game built with Ruby and Sinatra.

## Usage

```bash
cd web_guesser
ruby web_guesser.rb
```

Guess the random number between 0 to 100, you have 5 guesses before a new game is created.

The background color is:

- Bright red when the guess is way too high or way too low (guess is more than or less than five numbers)
- A light red (closer to white) when the guess is just a little bit high or low
- Green when the guess is correct

Add a cheat=true params to activate cheat mode
