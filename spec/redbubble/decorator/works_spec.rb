describe Redbubble::Decorator::Works do
  let(:xml) { File.read(file('works.xml')) }
  let(:works) { Redbubble::Model::Work.parse(xml) }
  subject(:decorator) { described_class.new(works) }

  describe '#all' do
    its(:all) { is_expected.to eq(works) }
  end

  describe '#limit' do
    it { expect(decorator.limit(:all, 5)[4]).to eq(decorator.all[4]) }
  end

  describe '#thumbnails' do
    it { expect(decorator.thumbnails.count).to eq(14) }
  end

  describe '#makes' do
    it 'returns all the camera makes' do
      expect(decorator.makes).to eq(
        ['NIKON CORPORATION', 'Canon', 'FUJIFILM', nil, 'LEICA', 'FUJI PHOTO FILM CO., LTD.', 'Panasonic']
      )
    end
  end

  describe '#models' do
    it 'returns all the camera models' do
      expect(decorator.models).to eq(
        ['NIKON D80', 'Canon EOS 20D', 'FinePix S6500fd', nil, 'D-LUX 3', 'SLP1000SE', 'DMC-FZ30', 'Canon EOS 400D DIGITAL']
      )
    end
  end

  describe '#where' do
    it { expect(decorator.where(make: 'LEICA').count).to eq(5) }
    it { expect(decorator.where(make: nil).count).to eq(2) }
    it { expect(decorator.where(model: 'FinePix S6500fd').count).to eq(1) }
    it { expect(decorator.where(model: nil).count).to eq(2) }
    it { expect(decorator.where(make: 'Canon', model: 'Canon EOS 20D').count).to eq(1) }
    it { expect(decorator.where(make: 'Carlton', model: 'Draught').count).to eq(0) } # :(
    it { expect { decorator.where(type: 'Beer') }.to raise_exception(NoMethodError, /undefined method/) }
  end
end
