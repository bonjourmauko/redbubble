module Redbubble
  class Parser
    class Exif
      include SAXMachine

      element :make
      element :model
    end
  end
end
