module Redbubble
  module View
    class Model < SimpleDelegator
      attr_reader :name

      def initialize(exif)
        @name = exif.model || 'Unknown'
        super
      end

      def href
        "model - #{name.downcase}.html"
      end
    end
  end
end
