---
  tags: oop 
  languages: ruby
  resources: 2
---

# Object Oriented Jukebox

## Description

In this lab, you'll be writing an Object Oriented Jukebox that will introduce itself to the user and ask for input. Users should be able to ask for help, list available songs, play a song, and exit the program from the command line.

## Instructions

Your `Jukebox` class should accept a list of songs upon initialization, and instances should respond to a `call` method. To run your program, all I should have to do is the following:

```ruby
songs = [
  "Artist1 - Song1",
  "Artist1 - Song2",
  "Artist2 - Song1"
]

player = Jukebox.new(songs)
player.call
```

After that, it should wait for input and respond to the following commands:

1. `help` - Tells me all of the commands I can type.
2. `list` - Lists all of the songs I can play.
3. `play` - Can be called in two different ways:
  * I can either type `play`, and then after being prompted again, type the name of a song or its number (when listed).
  * I can type `play <song_name/song_number> and the song will play.
4. `exit` - This exists the program.

Make the tests in `spec/jukebox_spec.rb` pass. Run them by typing `rspec` on your command line from the root of this project.

## Note

Don't reinvent the wheel! Since you've already written a pretty solid non-object oriented jukebox, steal your own code!

## Resources
* [Practical Object-Oriented Design in Ruby](http://books.flatironschool.com/books/102) - [Chapter 1: Object-Oriented Design](http://books.flatironschool.com/books/102), page 26
* [Practical Object-Oriented Design in Ruby](http://books.flatironschool.com/books/102) - [Chapter 2: Designing Classes with a Single Responsibility 15](http://books.flatironschool.com/books/102), page 40
