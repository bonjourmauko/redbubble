module Redbubble
  describe CLI do
    subject { described_class.new }

    describe '#htmlify' do
      context 'the filepath is correct' do
        specify { expect(subject.htmlify).to be true }

        pending 'eventually, test that it actually sends the message to the parser'
      end

      xcontext 'the filepath is not correct' do
        specify { expect { subject.htmlify }.to raise_error }
      end
    end
  end
end
