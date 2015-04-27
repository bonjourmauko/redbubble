describe Redbubble::View::Make do
  let(:works) { Redbubble::Model::Work.parse(file('works.xml')) }
  let(:exif) { works.first.exif }
  subject(:view) { described_class.new(exif) }

  its(:name) { is_expected.to eq('NIKON CORPORATION') }
  its(:href) { is_expected.to eq('make - nikon corporation.html') }

  context 'when make is nil' do
    let(:exif) { works[3].exif }

    its(:name) { is_expected.to eq('Unknown') }
    its(:href) { is_expected.to eq('make - unknown.html') }
  end
end
