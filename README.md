---
  tags: oop 
  languages: ruby
  resources: 2
---

# Object Oriented Jukebox

## Description

In this lab, you'll be writing an Object Oriented Jukebox, with similar functionality to the first CLI Jukebox you built: it will introduce itself to the user and ask for input, and users should be able to ask for help, list available songs, play a song, and exit the program, all from the command line.

## Instructions

Take a look at `bin/jukebox`. This executable file is run by typing `ruby bin/jukebox`. Note that the file requires `lib/jukebox.rb`.  Your `Jukebox` class should accept a list of songs upon initialization, and jukebox instances should respond to a `call` method.

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

## Note

Don't reinvent the wheel! Since you've already written a pretty solid non-object oriented jukebox, steal your own code!

## Resources
* [Practical Object-Oriented Design in Ruby](http://books.flatironschool.com/books/102) - [Chapter 1: Object-Oriented Design](http://books.flatironschool.com/books/102), page 26
* [Practical Object-Oriented Design in Ruby](http://books.flatironschool.com/books/102) - [Chapter 2: Designing Classes with a Single Responsibility 15](http://books.flatironschool.com/books/102), page 40
