module Redbubble
  module View
    class Make < SimpleDelegator
      attr_reader :name

      def initialize(exif)
        @name = exif.make ||= 'Unknown'
        super
      end

      def href
        "make - #{name.downcase}.html"
      end
    end
  end
end
