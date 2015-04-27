module Redbubble
  module Model
    class Work
      include SAXMachine

      element(:urls, as: :thumbnail) { |url| url[/http.+135x135.+jpg/] }
      element(:exif, class: Exif)

      def self.parse(xml)
        super(xml).all
      end

      private

      elements(:work, as: :all, class: Work)
    end
  end
end
