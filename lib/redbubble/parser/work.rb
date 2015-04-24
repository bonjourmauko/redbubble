module Redbubble
  class Parser
    class Work
      include SAXMachine

      element :urls, as: :url do |url|
        url[/http.+135x135.+jpg/]
      end

      element :exif, class: Exif
    end
  end
end
