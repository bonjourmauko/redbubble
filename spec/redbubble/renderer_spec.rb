describe Redbubble::Renderer do
  let(:works) { Redbubble::Model::Work.parse(file('works.xml')) }

  it { is_expected.to respond_to(:view) }
  it { is_expected.to respond_to(:template) }

  subject(:rendered) { described_class.new(view, template).render }

  context 'index' do
    let(:view) { Redbubble::View::Works.new(works) }
    let(:template) { templates('works.html') }

    it { is_expected.to have_tag(:title, text: 'Index') }
    it { is_expected.to have_tag(:h1, text: 'Index') }

    it 'renders links to the camera makes' do
      expect(rendered).to have_tag(:nav) do
        with_tag :a, count: 7

        view.makes.each do |make|
          with_tag :a, href: make.href, text: make.name
        end
      end
    end

    it 'renders anchors to the first 10 thumbnails' do
      expect(rendered).to have_tag(:main) do
        with_tag :img, count: 10

        view.limit(:all, 10).each do |work|
          with_tag :img, src: work.thumbnail
        end
      end
    end
  end

  context 'make' do
    let(:view) { Redbubble::View::Works.new(works).where(make: 'NIKON CORPORATION') }
    let(:template) { templates('make.html') }

    it { is_expected.to have_tag(:title, text: 'NIKON CORPORATION') }
    it { is_expected.to have_tag(:h1, text: 'Index') }

    it 'renders links to the camera makes' do
      expect(rendered).to have_tag(:nav) do
        with_tag :a, count: 7

        view.makes.each do |make|
          with_tag :a, href: make.href, text: make.name
        end
      end
    end

    it 'renders anchors to the first 10 thumbnails' do
      expect(rendered).to have_tag(:main) do
        with_tag :img, count: 10

        view.limit(:all, 10).each do |work|
          with_tag :img, src: work.thumbnail
        end
      end
    end
  end
end
