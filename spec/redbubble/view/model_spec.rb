describe Redbubble::View::Model do
  let(:works) { Redbubble::Model::Work.parse(file('works.xml')) }
  let(:exif) { works.first.exif }
  subject(:view) { described_class.new(exif) }

  its(:name) { is_expected.to eq('NIKON D80') }
  its(:href) { is_expected.to eq('model - nikon d80.html') }

  context 'when make is nil' do
    let(:exif) { works[3].exif }

    its(:name) { is_expected.to eq('Unknown') }
    its(:href) { is_expected.to eq('model - unknown.html') }
  end
end
