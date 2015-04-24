describe Redbubble::WorksCollection do
  let(:works) { Redbubble::Parser.new(file('works.xml')).parse }
  let(:makes) { ['Canon', 'FUJI PHOTO FILM CO., LTD.', 'FUJIFILM', 'LEICA', 'NIKON CORPORATION', 'Panasonic', nil] }
  let(:models) { ['Canon EOS 20D', 'Canon EOS 400D DIGITAL', 'D-LUX 3', 'DMC-FZ30', 'FinePix S6500fd', 'NIKON D80', 'SLP1000SE', nil] }
  subject(:collection) { described_class.new(works) }

  describe '.new' do
    its(:all) { is_expected.to eq(works) }
  end

  describe '#limit' do
    it { expect(collection.limit(:all, 5)[4]).to eq(collection.all[4]) }
  end

  describe '#makes' do
    its(:makes) { is_expected.to eq(makes) }
  end

  describe '#models' do
    its(:models) { is_expected.to eq(models) }
  end
end
