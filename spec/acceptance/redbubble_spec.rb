describe 'redbubble' do
  context 'works' do
    it 'generates the HTML files' do
      run_simple("redbubble -f #{filepath('works.xml')} -o tmp")
      check_file_presence([/tmp\/index/, /tmp\/make/, /tmp\/model/])
    end

    it 'says something nice to the user' do
      run_simple("redbubble -f #{filepath('works.xml')} -o tmp")
      expect(all_output).to match(/yeeah boi/i)
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
      run_simple('redbubble -f ananas.yml', false)
      expect(all_output).to match(/no value provided for.+--output/i)
      expect(last_exit_status).to eq(1)
    end
  end
end
