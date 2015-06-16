describe 'Jukebox' do
  let(:songs) {
    [
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
  }

  let(:song_regexes) {
    [
      /Phoenix - 1901/,
      /Tokyo Police Club - Wait Up/,
      /Sufjan Stevens - Too Much/,
      /The Naked and the Famous - Young Blood/,
      /\(Far From\) Home - Tiga/,
      /The Cults - Abducted/,
      /Phoenix - Consolation Prizes/,
      /Harry Chapman - Cats in the Cradle/,
      /Amos Lee - Keep It Loose, Keep It Tight/
    ]
  }

  let(:song_regexes_with_indicies) {
    [
      /1\. Phoenix - 1901/,
      /2\. Tokyo Police Club - Wait Up/,
      /3\. Sufjan Stevens - Too Much/,
      /4\. The Naked and the Famous - Young Blood/,
      /5\. \(Far From\) Home - Tiga/,
      /6\. The Cults - Abducted/,
      /7\. Phoenix - Consolation Prizes/,
      /8\. Harry Chapman - Cats in the Cradle/,
      /9\. Amos Lee - Keep It Loose, Keep It Tight/
    ]
  }

  let(:jukebox) { Jukebox.new(songs) }

  describe '#new' do
    it 'accepts a list of songs on initialization' do
      expect{Jukebox.new(songs)}.to_not raise_error
    end

    it 'assigns the list of songs to an instance variable' do
      expect(jukebox.instance_variable_get(:@songs)).to eq(songs)
    end

    it 'creates new instances of itself' do
      expect(jukebox).to be_an_instance_of(Jukebox)
    end
  end

  describe '#call' do
    it 'responds to a call method' do
      expect(jukebox).to respond_to(:call)
    end
  end

  describe '#help' do
    it 'prints the available commands' do
      help_output = capture_stdout { jukebox.help }
      expect(help_output).to match(/^(?=.*help)(?=.*list)(?=.*play)(?=.*exit).+/m)
    end
  end

  describe '#list' do
    it 'lists the songs a user can play' do
      list_output = capture_stdout { jukebox.list }
      song_regexes.each do |regex|
        expect(list_output).to match(regex)
      end
    end
  end

  describe '#play' do
    context 'with no arguments' do
      it 'asks the user what song they\'d like to play' do
        jukebox.stub(:gets).and_return("1")
        play_no_args_output = capture_stdout { jukebox.play }
        expect(play_no_args_output).to match(/Now Playing: Phoenix - 1901/)
      end
      
      it 'also accepts a song name' do
        jukebox.stub(:gets).and_return("Phoenix - 1901")
        play_no_args_output = capture_stdout { jukebox.play }
        expect(play_no_args_output).to match(/Now Playing: Phoenix - 1901/)
      end
    end

    context 'when given a song as an additional argument' do
      it 'can take a song name as an argument' do
        play_with_song_name_output = capture_stdout { jukebox.play("Phoenix - 1901") }
        expect(play_with_song_name_output).to match(/Now Playing: Phoenix - 1901/)
      end

      it 'can take a human-readable index' do
        play_with_song_num_output = capture_stdout { jukebox.play("1") }
        expect(play_with_song_num_output).to match(/Now Playing: Phoenix - 1901/)
      end
    end
  end
end
