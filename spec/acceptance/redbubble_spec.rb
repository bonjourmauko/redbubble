describe 'redbubble' do
  describe 'generates the HTML file(s)' do
    xit "assumes 'works.xml' is in the current path" do
      run_simple 'redbubble'
      expect(all_output).to match(/success/)
      assert_exit_status(0)
    end

    xit 'takes user provided works file path' do
      run_simple 'redbubble -f ../input.xml'
      expect(all_output).to match(/success/)
      assert_exit_status(0)
    end
  end

  describe 'fails' do
    xit 'the file path is incorrect' do
      run_simple 'redbubble'
      expect(all_output).to match(/error/)
      assert_exit_status(1)
    end

    xit 'the file structure is incorrect' do
      run_simple 'redbubble'
      expect(all_output).to match(/error/)
      assert_exit_status(1)
    end
  end
end
