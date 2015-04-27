describe Redbubble::Decorator::Work do
  let(:xml) { File.read(file('works.xml')) }
  subject(:decorator) { described_class.new(work) }

  context 'with values' do
    let(:work) { Redbubble::Model::Work.parse(xml).first }

    its(:make) { is_expected.to eq('NIKON CORPORATION') }
    its(:model) { is_expected.to eq('NIKON D80') }
    its(:thumbnail) { is_expected.to eq('http://ih1.redbubble.net/work.31820.1.flat,135x135,075,f.jpg') }
  end

  context 'without values' do
    let(:work) { double(exif: nil, make: nil, model: nil, thumbnail: nil) }

    its(:make) { is_expected.to eq('Unknown') }
    its(:model) { is_expected.to eq('Unknown') }
    its(:thumbnail) { is_expected.to be_nil }
  end
end
