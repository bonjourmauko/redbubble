module Redbubble
  Renderer = Struct.new(:view, :template)

  class Renderer
    def render
      ERB.new(template).result(binding)
    end
  end
end
