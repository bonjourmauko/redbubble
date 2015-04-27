module Redbubble
  module Model
    class Exif
      include SAXMachine

      element :make
      element :model
    end
  end
end
