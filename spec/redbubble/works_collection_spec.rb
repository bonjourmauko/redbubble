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

  describe '#pluck' do
    it { expect(collection.pluck(:make)).to eq(makes) }
    it { expect(collection.pluck(:model)).to eq(models) }
  end

  describe '#where' do
    it { expect(collection.where(make: 'LEICA').count).to eq(5) }
    it { expect(collection.where(make: nil).count).to eq(2) }
    it { expect(collection.where(model: 'FinePix S6500fd').count).to eq(1) }
    it { expect(collection.where(model: nil).count).to eq(2) }
    it { expect(collection.where(make: 'Canon', model: 'Canon EOS 20D').count).to eq(1) }
    it { expect(collection.where(make: 'Carlton', model: 'Draught').count).to eq(0) } # :(
    it { expect { collection.where(type: 'Beer') }.to raise_exception(NoMethodError, /undefined method/) }
  end
end
