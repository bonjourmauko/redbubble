describe Redbubble::Renderer do
  let(:works) { Redbubble::Model::Work.parse(file('works.xml')) }

  it { is_expected.to respond_to(:view) }
  it { is_expected.to respond_to(:template) }

  context 'index' do
    let(:view) { Redbubble::View::Works.new(works) }
    let(:template) { templates('index.html') }
    subject(:rendered) { described_class.new(view, template).render }

    it { is_expected.to have_tag(:title, text: 'Index') }
    it { is_expected.to have_tag(:h1, text: 'Index') }

    it 'renders navigation links to the camera makes' do
      expect(rendered).to have_tag(:nav) do
        with_tag :a, count: 7
      end
    end

    it 'renders anchors to the first 10 thumbnails' do
      expect(rendered).to have_tag(:main) do
        with_tag :img, count: 10
      end
    end
  end

  context 'make' do
    let(:view) { Redbubble::View::Works.new(works).where(make: 'NIKON CORPORATION') }
    let(:template) { templates('make.html') }
    subject(:rendered) { described_class.new(view, template).render }

    it { is_expected.to have_tag(:title, text: 'NIKON CORPORATION') }
    it { is_expected.to have_tag(:h1, text: 'NIKON CORPORATION') }

    it 'renders navigation links to the index' do
      expect(rendered).to have_tag(:a, text: 'Index')
    end

    it 'renders navigation links to the camera models' do
      expect(rendered).to have_tag(:a, text: 'NIKON D80')
    end

    it 'renders anchors to the first 10 thumbnails' do
      expect(rendered).to have_tag(:main) do
        with_tag :img, count: 1
      end
    end
  end

  context 'make' do
    let(:view) { Redbubble::View::Works.new(works).where(make: 'NIKON CORPORATION').where(model: 'NIKON D80') }
    let(:template) { templates('model.html') }
    subject(:rendered) { described_class.new(view, template).render }

    it { is_expected.to have_tag(:title, text: 'NIKON D80') }
    it { is_expected.to have_tag(:h1, text: 'NIKON D80') }

    it 'renders navigation links to the index' do
      expect(rendered).to have_tag(:a, text: 'Index')
    end

    it 'renders navigation links to the camera make' do
      expect(rendered).to have_tag(:a, text: 'NIKON CORPORATION')
    end

    it 'renders anchors to the first 10 thumbnails' do
      expect(rendered).to have_tag(:main) do
        with_tag :img, count: 1
      end
    end
  end
end
