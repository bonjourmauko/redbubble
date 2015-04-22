describe 'redbubble' do
  context 'default use' do
    xit "assumes 'works.xml' is in the current path and tries to generate the HTML file(s)" do
      run_simple 'redbubble'
      expect(all_output).to match(%r{works.xml})
      assert_exit_status(0)
    end

    xit 'takes user provided works file path and tries to generate the HTML file(s)' do
      run_simple 'redbubble -f ../input.xml'
      expect(all_output).to match(%r{input.xml})
      assert_exit_status(0)
    end
  end
end
