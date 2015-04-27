describe Redbubble::Model::Work do
  it { is_expected.to respond_to(:all) }
  it { is_expected.to respond_to(:thumbnail) }

  describe '#parse' do
    subject(:works) { described_class.parse(xml) }

    context 'valid xml file' do
      let(:xml) { file('works.xml') }

      it { is_expected.to be_a(Array) }
      its(:size) { is_expected.to eq(14) }
    end

    context 'invalid xml file' do
      let(:xml) { file('bananas.xml') }

      its(:size) { is_expected.to eq(0) }
    end
  end
end
