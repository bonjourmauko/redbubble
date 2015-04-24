describe Redbubble::Parser do
  describe '.new' do
    subject(:parser) { described_class.new(filepath) }

    context 'existing file' do
      let(:filepath) { file('works.xml') }

      it { expect { parser }.not_to raise_error }
    end

    context 'non existing file' do
      let(:filepath) { 'asdf1234.xml' }

      it { expect { parser }.to raise_error(Errno::ENOENT, /no such file or directory/i) }
    end
  end

  describe '#parse' do
    let(:works) { described_class.new(filepath).parse }

    context 'valid xml file' do
      let(:filepath) { file('works.xml') }

      context 'works' do
        subject { works }

        it { is_expected.to be_a(Array) }
        its(:size) { is_expected.to eq(14) }
      end

      context 'work' do
        subject(:work) { works.first }

        it { is_expected.to be_a(described_class::Work) }
        its(:url) { is_expected.to eq('http://ih1.redbubble.net/work.31820.1.flat,135x135,075,f.jpg') }

        describe '//exif' do
          subject(:exif) { work.exif }

          it { is_expected.to be_a(described_class::Exif) }
          its(:make) { is_expected.to eq('NIKON CORPORATION') }
          its(:model) { is_expected.to eq('NIKON D80') }
        end
      end
    end

    context 'invalid xml file' do
      let(:filepath) { file('bananas.xml') }
      subject { works }

      its(:size) { is_expected.to eq(0) }
    end
  end
end
