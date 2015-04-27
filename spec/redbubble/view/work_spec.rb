describe Redbubble::View::Work do
  let(:work) { Redbubble::Model::Work.parse(file('works.xml')).first }
  subject(:view) { described_class.new(work) }

  its(:make) { is_expected.to be_a(Redbubble::View::Make) }
  its(:model) { is_expected.to be_a(Redbubble::View::Model) }
  its(:thumbnail) { is_expected.to eq('http://ih1.redbubble.net/work.31820.1.flat,135x135,075,f.jpg') }
end
