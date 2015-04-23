describe Redbubble::Parser do
  describe '.parse' do
    subject(:array) { described_class.parse(filepath) }

    context 'valid xml file' do
      let(:filepath) { file('works.xml') }

      it { is_expected.to be_a(Array) }
      it { expect(array.first).to be_a(Hash) }
      it { expect(array.first).to include('urls') }
      it { expect(array.first['exif']).to include('make') }
      it { expect(array.first['exif']).to include('model') }
    end

    context 'invalid xml file' do
      let(:filepath) { file('bananas.xml') }

      it { expect { array }.to raise_error(NoMethodError, /undefined method `\[\]'/) }
    end

    context 'non existing file' do
      let(:filepath) { 'asdf1234.xml' }

      it { expect { array }.to raise_error(Errno::ENOENT, /no such file or directory/i) }
    end
  end
end
