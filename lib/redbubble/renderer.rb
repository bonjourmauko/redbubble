module Redbubble
  Renderer = Struct.new(:collection, :template)

  class Renderer
    alias_method :object, :collection

    def render
      ERB.new(File.read(template)).result(binding)
    end
  end
end
