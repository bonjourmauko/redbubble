describe 'redbubble' do
  context 'generates the HTML files' do
    # Test actualy writing to filesystem .
    xit 'works' do
      run_simple 'redbubble'
      expect(all_output).to match(/success/)
      assert_exit_status(0)
    end
  end

  context 'fails' do
    it 'the file path is incorrect' do
      run_simple('redbubble -f ananas.xml -o .', false)
      expect(all_output).to match(/no such file or directory/i)
      expect(last_exit_status).to eq(1)
    end

    it 'without filepath' do
      run_simple('redbubble -o .', false)
      expect(all_output).to match(/no value provided for.+--filepath/i)
      expect(last_exit_status).to eq(1)
    end

    it 'without output' do
      run_simple("redbubble -f #{file('works.xml')}", false)
      expect(all_output).to match(/no value provided for.+--output/i)
      expect(last_exit_status).to eq(1)
    end
  end
end
