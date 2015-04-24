describe Redbubble::WorksRenderer do
  it { is_expected.to respond_to(:collection) }
  it { is_expected.to respond_to(:template) }

  context 'index' do
    let(:works) { Redbubble::Parser.new(file('works.xml')).parse }
    let(:collection) { Redbubble::WorksCollection.new(works) }
    let(:template) { templates('works-index.html') }
    subject(:rendered) { described_class.new(collection, template).render }

    it { is_expected.to have_tag('title', text: 'Index') }
    it { is_expected.to have_tag('h1', text: 'Index') }
  end
end
