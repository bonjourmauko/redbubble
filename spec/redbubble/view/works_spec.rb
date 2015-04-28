describe Redbubble::View::Works do
  let(:works) { Redbubble::Model::Work.parse(file('works.xml')) }
  subject(:view) { described_class.new(works) }

  describe '#all' do
    its(:all) { is_expected.to eq(works) }
  end

  describe '#thumbnails' do
    it { expect(view.thumbnails.count).to eq(14) }
  end

  describe '#makes' do
    it 'returns all the camera makes' do
      expect(view.makes.first.name).to eq('NIKON CORPORATION')
      expect(view.makes.count).to eq(7)
    end
  end

  describe '#models' do
    it 'returns all the camera models' do
      expect(view.models.first.name).to eq('NIKON D80')
      expect(view.models.count).to eq(8)
    end
  end

  describe '#where' do
    it { expect(view.where(make: 'LEICA').count).to eq(5) }
    it { expect(view.where(make: 'Unknown').count).to eq(2) }
    it { expect(view.where(model: 'FinePix S6500fd').count).to eq(1) }
    it { expect(view.where(model: 'Unknown').count).to eq(2) }
    it { expect(view.where(make: 'Canon', model: 'Canon EOS 20D').count).to eq(1) }
    it { expect(view.where(make: 'Carlton', model: 'Draught').count).to eq(0) } # :(
    it { expect { view.where(type: 'Beer') }.to raise_exception(NoMethodError, /undefined method/) }
  end
end
