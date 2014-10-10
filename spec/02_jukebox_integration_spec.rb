describe 'Running Jukebox' do
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

  context 'entering commands' do
    describe 'help' do
      it 'lists the commands a user can type' do
        jukebox.stub(:gets).and_return('help', 'exit')
        help_output = capture_stdout { jukebox.call }
        expect(help_output).to match(/^(?=.*help)(?=.*list)(?=.*play)(?=.*exit).+/m)
      end
    end

    describe 'list' do
      it 'lists the songs a user can play' do
        jukebox.stub(:gets).and_return('list', 'exit')
        list_output = capture_stdout { jukebox.call }
        song_regexes.each do |regex|
          expect(list_output).to match(regex)
        end
      end
    end

    describe 'play' do
      context 'without a song as an argument' do
        it 'gives the user the option to then select a song by number' do
          jukebox.stub(:gets).and_return('play', '1', 'exit')
          play_no_args_output = capture_stdout { jukebox.call }
          expect(play_no_args_output).to match(/Now Playing: Phoenix - 1901/)
        end

        it 'otherwise gives the user the option to then select a song by name' do
          jukebox.stub(:gets).and_return('play', 'Phoenix - 1901', 'exit')
          play_no_args_output = capture_stdout { jukebox.call }
          expect(play_no_args_output).to match(/Now Playing: Phoenix - 1901/)
        end
      end

      context 'with a song as an argument' do
        it 'can take a human-readable index' do
          jukebox.stub(:gets).and_return('play 1', 'exit')
          play_with_song_name_output = capture_stdout { jukebox.call }
          expect(play_with_song_name_output).to match(/Now Playing: Phoenix - 1901/)
        end
        
        it 'can take a song name as an argument' do
          jukebox.stub(:gets).and_return('play Phoenix - 1901', 'exit')
          play_with_song_num_output = capture_stdout { jukebox.call }
          expect(play_with_song_num_output).to match(/Now Playing: Phoenix - 1901/)
        end
      end
    end
  end
end