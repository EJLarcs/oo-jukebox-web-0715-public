require 'pry'

class Jukebox

attr_accessor :commands
attr_reader :help

  def initialize(songs)
    @songs = songs
  end

  # def commands
  #   @commands = [help, list, play, exit]
  # end

  def help
    puts "help"
    puts "list"
    puts "play"
    puts "exit"
  end

  def call
    puts "How can I help you?"
    user_input = gets.chomp
    if user_input == "help"
      help
    elsif user_input == list
      list
    elsif user_input == play
      "Select song by number"
      user_input = gets.chomp
      if user_input.class == Fixnum
        if user_input < 0 || user_input > 9
        else
        puts songs[user_input -1]
        end
      else
        @songs.each do |song|
            puts "/Now Playing: #{song}/"
          end
      end
    end
  end

  def list
  @songs.each {|song| puts song}
  end

  # describe '#play' do
  #   context 'with no arguments' do
  #     it 'asks the user what song they\'d like to play' do
  #       jukebox.stub(:gets).and_return("1")
  #       play_no_args_output = capture_stdout { jukebox.play }
  #       expect(play_no_args_output).to match(/Now Playing: Phoenix - 1901/)
  #     end
  #
  def play(*song)
  @songs.each do |song|
      puts "/Now Playing: #{song}/"
    end

  end



end
