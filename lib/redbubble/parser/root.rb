module Redbubble
  class Parser
    class Root
      include SAXMachine

      elements :work, as: :works, class: Work
    end
  end
end
