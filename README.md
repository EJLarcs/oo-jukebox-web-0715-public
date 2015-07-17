---
  tags: oop 
  languages: ruby
  resources: 2
---

# Object Oriented Jukebox

![jukebox drawing](https://s3-us-west-2.amazonaws.com/web-dev-readme-photos/oo-labs/jukebox.jpeg)

## Description

In this lab, you'll be writing an Object Oriented Jukebox. Your Jukebox will introduce itself to the user and ask for input, and users should be able to ask for help, list available songs, play a song, and exit the program, all from the command line.

## Instructions

Take a look at `bin/jukebox`. This file is run by typing `ruby bin/jukebox`. Note that the file requires `lib/jukebox.rb`.  Your `Jukebox` class should accept a list of songs upon initialization, and jukebox instances should respond to a `call` method.

```ruby
songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapman - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

jukebox = Jukebox.new(songs)
jukebox.call
```

After that, your program should wait for input and respond to the following commands:

1. `help` - Lists all commands a user can type.
2. `list` - Lists all of the songs.
3. `play` - Can be called in two different ways:
  * a user can type `play`, and then after being prompted again, type the name of a song or its number (when listed).
  * a user can type `play <song_name/song_number>` and the song will play.
4. `exit` - This exists the program.

Make the tests in `spec/jukebox_spec.rb` pass!

Hint 1. Don't assume your users are going to put in the commands exactly as you'd expect. It may be helpful to standardize your input before you compare it to account for all the possible scenarios of what a user might write in. [Ruby docs](http://ruby-doc.org/core-2.2.0/Array.html) -- there may already be a method that exists to clean up `gets` input.

Hint 2. When creating your `play` method it may be helpful to draw out the different scenarios your app might encounter. Every if or elsif should result in a new branch of that tree. Then work your way back up by filling in pseudo-code for what needs to happen at each branch. 

Hint 3. Proper indentation can be really helpful when you're dealing with complex if/else statements. It can be helpful to write a comment after each end to remind yourself which block or method it's closing. Using helper methods isn't required, but they can be helpful to break up your code so that it's easier to understand. 


